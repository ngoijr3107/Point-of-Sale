<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Modules\Expense\Entities\Expense;
use Modules\Product\Entities\Product;
use Modules\Purchase\Entities\Purchase;
use Modules\Purchase\Entities\PurchasePayment;
use Modules\PurchasesReturn\Entities\PurchaseReturn;
use Modules\PurchasesReturn\Entities\PurchaseReturnPayment;
use Modules\Sale\Entities\Sale;
use Modules\Sale\Entities\SaleDetails;
use Modules\Sale\Entities\SalePayment;
use Modules\SalesReturn\Entities\SaleReturn;
use Modules\SalesReturn\Entities\SaleReturnPayment;
use App\Exports\CashFlowOverviewExport;
use Maatwebsite\Excel\Facades\Excel;


class HomeController extends Controller
{
    public function exportCashFlowOverview(Request $request)
    {
        $currentYear = date('Y');
        $months = [];

        for ($month = 1; $month <= 12; $month++) {
            $monthSales = SaleDetails::whereYear('created_at', '=', $currentYear)
                ->whereMonth('created_at', '=', $month)
                ->get();

            $monthTotalQuantity = $monthSales->sum('quantity');
            $monthSubTotal = $monthSales->sum('sub_total');
            $monthUnpaid = Sale::whereYear('created_at', '=', $currentYear)
                ->whereMonth('created_at', '=', $month)
                ->sum('due_amount');
            $monthExpenses = Expense::whereYear('created_at', '=', $currentYear)
                ->whereMonth('created_at', '=', $month)
                ->sum('amount');

            $months[] = [
                'month' => date('F', mktime(0, 0, 0, $month, 1)),
                'totalQuantity' => $monthTotalQuantity,
                'subTotal' => $monthSubTotal,
                'dueAmount' => $monthUnpaid / 100,
                'expenses' => $monthExpenses / 100,
            ];
        }

        $export = new CashFlowOverviewExport($months);
        $filename = 'sale_overview_' . date('Y-m-d') . '.xlsx';
        return Excel::download($export, $filename);
    }




    public function index()
    {
        $sales = Sale::completed()->sum('total_amount');
        $sale_returns = SaleReturn::completed()->sum('total_amount');
        $purchase_returns = PurchaseReturn::completed()->sum('total_amount');
        $unpaid = Sale::completed('payment_status', '=', 'Unpaid')->sum('due_amount');
        $expenses = Expense::sum('amount');
        $product_costs = 0;

        $product_costs = Sale::completed()
            ->with('saleDetails.product')
            ->get()
            ->flatMap(function ($sale) {
                return $sale->saleDetails ?? [];
            })
            ->sum(function ($saleDetail) {
                return $saleDetail->product->product_cost ?? 0;
            });


        $revenue = ($sales - $sale_returns) / 100;
        $profit = $revenue - $product_costs;

        return view('home', [
            'revenue'          => $revenue,
            'sale_returns'     => $sale_returns / 100,
            'purchase_returns' => $purchase_returns / 100,
            'profit'           => $profit,
            'unpaid' => $unpaid / 100,
            'expenses' => $expenses / 100,
        ]);
    }


    public function currentMonthChart()
    {
        abort_if(!request()->ajax(), 404);

        $currentMonthSales = Sale::where('status', 'Completed')->whereMonth('date', date('m'))
            ->whereYear('date', date('Y'))
            ->sum('total_amount') / 100;
        $currentMonthPurchases = Purchase::where('status', 'Completed')->whereMonth('date', date('m'))
            ->whereYear('date', date('Y'))
            ->sum('total_amount') / 100;
        $currentMonthExpenses = Expense::whereMonth('date', date('m'))
            ->whereYear('date', date('Y'))
            ->sum('amount') / 100;

        return response()->json([
            'sales'     => $currentMonthSales,
            'purchases' => $currentMonthPurchases,
            'expenses'  => $currentMonthExpenses
        ]);
    }

    public function todaySalesOverview()
    {
        abort_if(!request()->ajax(), 404);

        $sale_details = SaleDetails::get('created_at', 'd-y-m');

        return response()->json(['sale_details' => $sale_details]);
        return view('home', compact(['sale_details' => $sale_details]));
    }


    public function salesPurchasesChart()
    {
        abort_if(!request()->ajax(), 404);

        $sales = $this->salesChartData();
        $purchases = $this->purchasesChartData();

        return response()->json([
            'sales' => $sales,
            'purchases' => $purchases,
        ]);
    }



    public function paymentChart()
    {
        abort_if(!request()->ajax(), 404);

        $dates = collect();
        foreach (range(-11, 0) as $i) {
            $date = Carbon::now()->addMonths($i)->format('m-Y');
            $dates->put($date, 0);
        }

        $date_range = Carbon::today()->subYear()->format('Y-m-d');

        $sale_payments = SalePayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $sale_return_payments = SaleReturnPayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $purchase_payments = PurchasePayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $purchase_return_payments = PurchaseReturnPayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $expenses = Expense::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $payment_received = array_merge_numeric_values($sale_payments, $purchase_return_payments);
        $payment_sent = array_merge_numeric_values($purchase_payments, $sale_return_payments, $expenses);

        $dates_received = $dates->merge($payment_received);
        $dates_sent = $dates->merge($payment_sent);

        $received_payments = [];
        $sent_payments = [];
        $months = [];

        foreach ($dates_received as $key => $value) {
            $received_payments[] = $value;
            $months[] = $key;
        }

        foreach ($dates_sent as $key => $value) {
            $sent_payments[] = $value;
        }

        return response()->json([
            'payment_sent' => $sent_payments,
            'payment_received' => $received_payments,
            'months' => $months,
        ]);
    }

    public function salesChartData()
    {
        $dates = collect();
        foreach (range(-6, 0) as $i) {
            $date = Carbon::now()->addDays($i)->format('d-m-y');
            $dates->put($date, 0);
        }

        $date_range = Carbon::today()->subDays(6);

        $sales = Sale::where('status', 'Completed')
            ->where('date', '>=', $date_range)
            ->groupBy(DB::raw("DATE_FORMAT(date,'%d-%m-%y')"))
            ->orderBy('date')
            ->get([
                DB::raw(DB::raw("DATE_FORMAT(date,'%d-%m-%y') as date")),
                DB::raw('SUM(total_amount) AS count'),
            ])
            ->pluck('count', 'date');

        $dates = $dates->merge($sales);

        $data = [];
        $days = [];
        foreach ($dates as $key => $value) {
            $data[] = $value / 100;
            $days[] = $key;
        }

        return response()->json(['data' => $data, 'days' => $days]);
    }


    public function purchasesChartData()
    {
        $dates = collect();
        foreach (range(-6, 0) as $i) {
            $date = Carbon::now()->addDays($i)->format('d-m-y');
            $dates->put($date, 0);
        }

        $date_range = Carbon::today()->subDays(6);

        $purchases = Purchase::where('status', 'Completed')
            ->where('date', '>=', $date_range)
            ->groupBy(DB::raw("DATE_FORMAT(date,'%d-%m-%y')"))
            ->orderBy('date')
            ->get([
                DB::raw(DB::raw("DATE_FORMAT(date,'%d-%m-%y') as date")),
                DB::raw('SUM(total_amount) AS count'),
            ])
            ->pluck('count', 'date');

        $dates = $dates->merge($purchases);

        $data = [];
        $days = [];
        foreach ($dates as $key => $value) {
            $data[] = $value / 100;
            $days[] = $key;
        }

        return response()->json(['data' => $data, 'days' => $days]);
    }
}
