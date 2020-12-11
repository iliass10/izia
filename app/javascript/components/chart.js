const createChart = (metric, low, q1, q3, high) => {
  anychart.onDocumentReady(function () {
    // retrieve data from HTML
    const taux = document.getElementById(metric).dataset.taux;

    // create data
    var data = [
      {x: "", low: low, q1: q1, median: taux, q3: q3, high: high}
    ];

    // create a chart
    var chart = anychart.vertical();

    // create a box series and set the data
    var series = chart.box(data);
    series.normal().medianStroke("#dd2c00", 2, "10 5", "round");

    // set the chart title
    //chart.title("Vertical Box Chart");

    chart.xAxis(false);



    // set the container id
    chart.container(metric);

    // initiate drawing the chart
    chart.draw();
  });
};

export { createChart };
