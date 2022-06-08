import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicPm1 extends StatefulWidget {
  @override
  _GraphicPm1State createState() => _GraphicPm1State();
}

class _GraphicPm1State extends State<GraphicPm1> {

  // ignore: unused_field
  Query _refNod2;

  List<SalesData> _chartData5;
  var _tooltipBehavior5;

  @override
 void initState() {
  _chartData5 = getChartData(); 
    _tooltipBehavior5 = TooltipBehavior(enable: true);
    _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,59),
        SalesData(13,90),
        SalesData(14,90),
        SalesData(15,90),
        SalesData(16,90),
        SalesData(17,90),
        SalesData(18,90),
        SalesData(19,90),
        SalesData(20,90),
        SalesData(21,90),
        SalesData(22,90),
        SalesData(23,90),
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
        yValue = dataMap['pm1'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}