import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicPm2 extends StatefulWidget {
  @override
  _GraphicPm2State createState() => _GraphicPm2State();
}

class _GraphicPm2State extends State<GraphicPm2> {

  // ignore: unused_field
  Query _refNod2;

  List<SalesData> _chartData6;
  var _tooltipBehavior6;

  @override
 void initState() {
  _chartData6 = getChartData(); 
    _tooltipBehavior6 = TooltipBehavior(enable: true);
    _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,4),
        SalesData(13,2),
        SalesData(14,2),
        SalesData(15,2),
        SalesData(16,2),
        SalesData(17,2),
        SalesData(18,2),
        SalesData(19,2),
        SalesData(20,2),
        SalesData(21,2),
        SalesData(22,2),
        SalesData(23,2),
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
        yValue = dataMap['pm2_5'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}