<?php
$dest = new mysqli('localhost','root','','dest');

$dest->set_charset('utf8');

$q = $dest->query('select SUM(s.quant) as quant,EXTRACT(YEAR FROM o.time) year from sales s 
JOIN orders o ON o.id = s.order_id
GROUP BY year');
$arr = array();
while($r = $q->fetch_assoc()){
	
	$arr[] = $r;
}
$str = '';
foreach($arr as $v){
$str.='["'.$v['year'].'",'.$v['quant'].'],';
}


?>

<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>
<body>
  <script type="text/javascript">
 google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Year', 'Sales'],
          <?=$str?>
        ]);

        var options = {
          title: 'Sales',
          width: 900,
          legend: { position: 'none' },
          chart: { subtitle: '' },
          axes: {
            x: {
              0: { side: 'top', label: ''} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
  </script>
<div id="top_x_div" style="width: 900px; height: 300px;"></div>