import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class Nodo1Pm1 extends StatefulWidget {
  @override
  _Nodo1Pm1State createState() => _Nodo1Pm1State();
}

class _Nodo1Pm1State extends State<Nodo1Pm1> {

  // ignore: unused_field
  Query _refNod1;

  List<SalesData> _chartData5;
  var _tooltipBehavior5;

  @override
 void initState() {
  _chartData5 = getChartData(); 
    _tooltipBehavior5 = TooltipBehavior(enable: true);
     _refNod1 =
          FirebaseDatabase.instance.reference().child('node1').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(1,0),
        SalesData(2,0),
        SalesData(3,0),
        SalesData(4,0),
        SalesData(5,0),
        SalesData(6,0),
        SalesData(7,0),
        SalesData(8,0),
        SalesData(9,0),
        SalesData(10,0),
        SalesData(11,6),
        SalesData(12,5),
      ];
      return chartData;
    }
  
    @override
    Widget build(BuildContext context)  => Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SfCartesianChart(
                  title: ChartTitle(text: "Comportamiento Partículas Suspendidas(PM1)"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior5,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "PM1",
                      color: Colors.lightGreen,
                      dataSource: _chartData5,
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
        yValue = dataMap['PM1'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}