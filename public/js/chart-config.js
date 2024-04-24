/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!**************************************!*\
  !*** ./resources/js/chart-config.js ***!
  \**************************************/
$(document).ready(function () {
  var salesPurchasesBar = document.getElementById('salesPurchasesChart');
  $.get('/sales-purchases/chart-data', function (response) {
    var salesPurchasesChart = new Chart(salesPurchasesBar, {
      type: 'bar',
      data: {
        labels: response.sales.original.days,
        datasets: [{
          label: 'Sales',
          data: response.sales.original.data,
          backgroundColor: ['#5CA98D'],
          borderColor: ['#5CA98D'],
          borderWidth: 1
        }, {
          label: 'Purchases',
          data: response.purchases.original.data,
          backgroundColor: ['#1F3665'],
          borderColor: ['#1F3665'],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  });
  var overviewChart = document.getElementById('currentMonthChart');
  $.get('/current-month/chart-data', function (response) {
    var currentMonthChart = new Chart(overviewChart, {
      type: 'doughnut',
      data: {
        labels: ['Sales', 'Purchases', 'Expenses'],
        datasets: [{
          data: [response.sales, response.purchases, response.expenses],
          backgroundColor: ['#5CA98D', '#1F3665', '#EF4444'],
          hoverBackgroundColor: ['#5CA98D', '#1F3665', '#EF4444']
        }]
      }
    });
  });
  var paymentChart = document.getElementById('paymentChart');
  $.get('/payment-flow/chart-data', function (response) {
    console.log(response);
    var cashflowChart = new Chart(paymentChart, {
      type: 'bar',
      data: {
        labels: response.months,
        datasets: [{
          label: 'Payment Sent',
          data: response.payment_sent,
          backgroundColor: ['#EF4444'],
          borderColor: ['#EF4444'],
          borderWidth: 1
        }, {
          label: 'Payment Received',
          data: response.payment_received,
          backgroundColor: ['#5CA98D'],
          borderColor: ['#5CA98D'],
          borderWidth: 1
        }]
      }
    });
  });
});
/******/ })()
;