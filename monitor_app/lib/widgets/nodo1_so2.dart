import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class Nodo1So2 extends StatefulWidget {
  @override
  _Nodo1So2State createState() => _Nodo1So2State();
}

class _Nodo1So2State extends State<Nodo1So2> {

   // ignore: unused_field
  Query _refNod1;

   List<SalesData> _chartData4;
  var _tooltipBehavior4;

  @override
 void initState() {
  _chartData4 = getChartData(); 
  _tooltipBehavior4 = TooltipBehavior(enable: true);
  _refNod1 =
        FirebaseDatabase.instance.reference().child('node1').limitToLast(12);
   super.initState();
 }

 /// Create one series with sample hard coded data.
  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(1,0.010),
      SalesData(2,0.009),
      SalesData(3,0.011),
      SalesData(4,0.007),
      SalesData(5,0.009),
      SalesData(6,0.008),
      SalesData(7,0.007),
      SalesData(8,0.008),
      SalesData(9,0.007),
      SalesData(10,0.008),
      SalesData(11,0.010),
      SalesData(12,0.009),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) => Container(width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SfCartesianChart(
                title: ChartTitle(text: "Comportamiento Dióxido de azufre"),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior4,
                series: <ChartSeries>[
                  LineSeries<SalesData, double>(
                    name: "Dióxido de azufre(SO2)",
                    color: Colors.orange,
                    dataSource: _chartData4,
                    xValueMapper: (SalesData sales,_)=>sales.year,
                    yValueMapper: (SalesData sales,_)=>sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible:true),
                    enableTooltip: true
                    )
                ],
                primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: NumericAxis(labelFormat: '{value}ppm')
              ),
            ),
          ]
        ),
      ),
  );
}

class ChartData {
  ChartData({this.xValue, this.yValue});
  ChartData.fromMap(Map<String, dynamic> dataMap)
      : xValue = dataMap['ts'],
        yValue = dataMap['SO2'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}