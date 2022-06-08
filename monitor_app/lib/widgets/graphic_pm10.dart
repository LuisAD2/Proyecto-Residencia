import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicPm10 extends StatefulWidget {
  @override
  _GraphicPm10State createState() => _GraphicPm10State();
}

class _GraphicPm10State extends State<GraphicPm10> {

  // ignore: unused_field
  Query _refNod2;

  List<SalesData> _chartData7;
  var _tooltipBehavior7;

  @override
 void initState() {
  _chartData7 = getChartData(); 
    _tooltipBehavior7 = TooltipBehavior(enable: true);
    _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,2),
        SalesData(13,2),
        SalesData(14,2),
        SalesData(15,6),
        SalesData(16,7),
        SalesData(17,4),
        SalesData(18,2),
        SalesData(19,4),
        SalesData(20,2),
        SalesData(21,8),
        SalesData(22,6),
        SalesData(23,4),
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
        yValue = dataMap['pm10'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}