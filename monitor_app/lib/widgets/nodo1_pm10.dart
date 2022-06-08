import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class Nodo1Pm10 extends StatefulWidget {
  @override
  _Nodo1Pm10State createState() => _Nodo1Pm10State();
}

class _Nodo1Pm10State extends State<Nodo1Pm10> {

  // ignore: unused_field
  Query _refNod1;

   List<SalesData> _chartData7;
  var _tooltipBehavior7;

  @override
 void initState() {
  _chartData7 = getChartData(); 
  _tooltipBehavior7 = TooltipBehavior(enable: true);
  _refNod1 =
        FirebaseDatabase.instance.reference().child('node1').limitToLast(12);
   super.initState();
 }

 /// Create one series with sample hard coded data.
  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(1,53),
      SalesData(2,52),
      SalesData(3,52),
      SalesData(4,55),
      SalesData(5,56),
      SalesData(6,52),
      SalesData(7,51),
      SalesData(8,52),
      SalesData(9,55),
      SalesData(10,57),
      SalesData(11,40),
      SalesData(12,55),
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
                title: ChartTitle(text: "Comportamiento Partículas Suspendidas(PM10)"),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior7,
                series: <ChartSeries>[
                  LineSeries<SalesData, double>(
                    name: "PM10",
                    color: Colors.red,
                    dataSource: _chartData7,
                    xValueMapper: (SalesData sales,_)=>sales.year,
                    yValueMapper: (SalesData sales,_)=>sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible:true),
                    enableTooltip: true
                    )
                ],
                primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: NumericAxis(labelFormat: '{value}µg/m3')
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
        yValue = dataMap['PM10'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}