@extends('layouts.app')

@section('title', 'Home')

@section('breadcrumb')
    <ol class="breadcrumb border-0 m-0">
        <li class="breadcrumb-item active">Home</li>
    </ol>
@endsection

@section('content')
    <div class="container-fluid">
        @can('show_total_stats')
        {{-- <div class="row">
            @foreach (Modules\Product\Entities\Product::where('product_quantity', '<=', 'product_stock_alert')->get() as $item)
                <li style="color: red;"> <strong> {{ $item->product_code }} product is running out of stock </strong></li>
            @endforeach
        </div> --}}

            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0">
                        <div class="card-body p-0 d-flex align-items-center shadow-sm">
                            <div class="bg-gradient-success p-4 mfe-3 rounded-left">
                                <i class="bi bi-bar-chart font-2xl"></i>
                            </div>
                            <div>
                                <div class="text-value text-primary">{{ format_currency($revenue) }}</div>
                                <div class="text-muted text-uppercase font-weight-bold small">Revenue</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3">
                    <div class="card border-0">
                        <div class="card-body p-0 d-flex align-items-center shadow-sm">
                            <div class="bg-gradient-warning p-4 mfe-3 rounded-left">
                                <i class="bi bi-arrow-return-left font-2xl"></i>
                            </div>
                            <div>
                                <div class="text-value text-warning">{{ format_currency($sale_returns) }}</div>
                                <div class="text-muted text-uppercase font-weight-bold small">Sales Return</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3">
                    <div class="card border-0">
                        <div class="card-body p-0 d-flex align-items-center shadow-sm">
                            <div class="bg-gradient-danger p-4 mfe-3 rounded-left">
                                {{-- <i class="bi bi-arrow-warning font-2xl"></i> --}}
                                <i class="bi bi-exclamation-circle font-2xl"></i>
                            </div>
                            <div>
                                <div class="text-value text-danger">{{ format_currency($unpaid) }}</div>
                                <div class="text-muted text-uppercase font-weight-bold small">Unpaid</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3">
                    <div class="card border-0">
                        <div class="card-body p-0 d-flex align-items-center shadow-sm">
                            <div class="bg-gradient-info p-4 mfe-3 rounded-left">
                                {{-- <i class="bi bi-trophy font-2xl"></i> --}}
                                <i class="bi bi-layout-wtf font-2xl"></i>
                            </div>
                            <div>
                                <div class="text-value text-info">{{ format_currency($expenses) }}</div>
                                <div class="text-muted text-uppercase font-weight-bold small">Expenses</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endcan

        {{-- @can('show_weekly_sales_purchases|show_month_overview')
            <div class="row mb-4">
                @can('show_weekly_sales_purchases')
                    <div class="col-lg-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header">
                                Sales & Purchases of Last 7 Days
                            </div>
                            <div class="card-body">
                                <canvas id="salesPurchasesChart"></canvas>
                            </div>
                        </div>
                    </div>
                @endcan
                @can('show_month_overview')
                    <div class="col-lg-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header">
                                Overview of {{ now()->format('F, Y') }}
                            </div>
                            <div class="card-body d-flex justify-content-center">
                                <div class="chart-container" style="position: relative; height:auto; width:280px">
                                    <canvas id="currentMonthChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                @endcan
            </div>
        @endcan --}}

            <div class="row mb-4">
                @can('show_weekly_sales_purchases')
                    <div class="col-lg-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header">
                                Sales trend of the Last 7 Days
                                {{-- Overview of Today sales --}}
                            </div>
                            <div class="card-body">
                                <canvas id="salesPurchasesChart"></canvas>
                                {{-- <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach (Modules\Sale\Entities\SaleDetails::whereDate('created_at', '=', date('Y-m-d'))->get() as $item)
                                            <tr>
                                                <td>{{ $item->product_name }}</td>
                                                <td>{{ $item->quantity }}</td>
                                                <td>{{ $item->sub_total }}</td>
                                                <td>{{ $item->created_at->format('Y-m-d') }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>

                                </table> --}}
                            </div>
                        </div>
                    </div>
                @endcan
                @can('show_month_overview')
                    <div class="col-lg-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header">
                                Overview of {{ now()->format('F, Y') }}
                            </div>
                            <div class="card-body d-flex justify-content-center">
                                <div class="chart-container" style="position: relative; height:auto; width:280px">
                                    <canvas id="currentMonthChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                @endcan
            </div>


        @can('show_monthly_cashflow')
            {{-- <div class="row">
                <div class="col-lg-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header">
                            Monthly Cash Flow (Payment Sent & Received)
                        </div>
                        <div class="card-body">
                            <canvas id="paymentChart"></canvas>
                        </div>
                    </div>
                </div>
            </div> --}}

            <div class="row">
                <div class="col-lg-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header">
                            Overview of {{ now()->format('Y') }}
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <a href="{{ route('exportCashFlowOverview') }}" class="btn btn-primary">Export</a>
                            </div>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Month</th>
                                        <th>Quantity</th>
                                        <th>Total Amount</th>
                                        <th>Due Amount</th>
                                        <th>Expenses</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $currentYear = date('Y');
                                        $months = [];

                                        for ($month = 1; $month <= 12; $month++) {
                                            $monthSales = Modules\Sale\Entities\SaleDetails::whereYear('created_at', '=', $currentYear)
                                                ->whereMonth('created_at', '=', $month)
                                                ->get();

                                            $monthTotalQuantity = $monthSales->sum('quantity');
                                            $monthSubTotal = $monthSales->sum('sub_total');
                                            $monthUnpaid = Modules\Sale\Entities\Sale::whereYear('created_at', '=', $currentYear)
                                                ->whereMonth('created_at', '=', $month)
                                                ->sum('due_amount');
                                            $monthExpenses = Modules\Expense\Entities\Expense::whereYear('created_at', '=', $currentYear)
                                                ->whereMonth('created_at', '=', $month)
                                                ->sum('amount');

                                            $months[$month] = [
                                                'totalQuantity' => $monthTotalQuantity,
                                                'subTotal' => $monthSubTotal,
                                                'expenses' => $monthExpenses / 100,
                                                'dueAmount' => $monthUnpaid / 100,
                                            ];
                                        }
                                    @endphp

                                    @foreach ($months as $month => $totals)
                                        <tr>
                                            <td>{{ date('F', mktime(0, 0, 0, $month, 1)) }}</td>
                                            <td>{{ $totals['totalQuantity'] }}</td>
                                            <td>{{ format_currency($totals['subTotal']) }}</td>
                                            <td>{{ format_currency($totals['dueAmount']) }}</td>
                                            <td>{{ format_currency($totals['expenses']) }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        @endcan
    </div>
@endsection

@section('third_party_scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"
        integrity="sha512-asxKqQghC1oBShyhiBwA+YgotaSYKxGP1rcSYTDrB0U6DxwlJjU59B67U8+5/++uFjcuVM8Hh5cokLjZlhm3Vg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
@endsection

@push('page_scripts')
    <script src="{{ mix('js/chart-config.js') }}"></script>
@endpush
