$(function() {
  var init_wb_chart = function(element) {
    var $widget = $(element);

    var table = new google.visualization.DataTable();
    table.addColumn("string", $widget.data("x-axis"));
    table.addColumn("number", $widget.data("y-axis"));
    table.addRows($widget.data("data"));

    var chart = new google.visualization.LineChart(element);
    chart.draw(table);
  };

  /* If there are any WorldBank charts on this page, load the Google viz API. */
  var widgets = $("div.worldbank-chart");
  if(widgets.length) {

    google.load("visualization", "1.0", {
      "packages": ["corechart"],
      "callback": function() {

        /* Iterate the charts to set each up. */
        _.each(widgets, init_wb_chart);
      }
    });
  }
});