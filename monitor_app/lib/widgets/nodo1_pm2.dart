import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class Nodo1Pm2 extends StatefulWidget {
  @override
  _Nodo1Pm2State createState() => _Nodo1Pm2State();
}

class _Nodo1Pm2State extends State<Nodo1Pm2> {

  // ignore: unused_field
  Query _refNod1;

   List<SalesData> _chartData6;
  var _tooltipBehavior6;

  @override
 void initState() {
  _chartData6 = getChartData(); 
    _tooltipBehavior6 = TooltipBehavior(enable: true);
    _refNod1 =
          FirebaseDatabase.instance.reference().child('node1').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(1,26),
        SalesData(2,25),
        SalesData(3,24),
        SalesData(4,26),
        SalesData(5,26),
        SalesData(6,26),
        SalesData(7,21),
        SalesData(8,26),
        SalesData(9,23),
        SalesData(10,26),
        SalesData(11,20),
        SalesData(12,27),
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
                  title: ChartTitle(text: "Comportamiento Partículas Suspendidas(PM2.5)"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior6,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "PM2.5",
                      color: Colors.deepPurple,
                      dataSource: _chartData6,
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
        yValue = dataMap['PM2_5'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}