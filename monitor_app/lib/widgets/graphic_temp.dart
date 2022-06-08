import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicTemp extends StatefulWidget {
  @override
  _GraphicTempState createState() => _GraphicTempState();
}

class _GraphicTempState extends State<GraphicTemp> {

  // ignore: unused_field
  Query _refNod2;

  List<SalesData> _chartData1;
  var _tooltipBehavior1;

  @override
 void initState() {
  _chartData1 = getChartData(); 
    _tooltipBehavior1 = TooltipBehavior(enable: true);
     _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,22.5),
        SalesData(13,22.67),
        SalesData(14,23.48),
        SalesData(15,24.61),
        SalesData(16,25.29),
        SalesData(17,26.05),
        SalesData(18,27.06),
        SalesData(19,28.51),
        SalesData(20,27.73),
        SalesData(21,27.98),
        SalesData(22,28.25),
        SalesData(23,28.17),
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
                  title: ChartTitle(text: "Comportamiento Temperatura"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior1,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "Temperatura(°C)",
                      color: Colors.orange,
                      dataSource: _chartData1,
                      xValueMapper: (SalesData sales,_)=>sales.year,
                      yValueMapper: (SalesData sales,_)=>sales.sales,
                      dataLabelSettings: DataLabelSettings(isVisible:true),
                      enableTooltip: true
                      )
                  ],
                  primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                  primaryYAxis: NumericAxis(labelFormat: '{value}°C')
                ),
              ),
            ]
          ),
        ),
    );
}

/// Sample linear data type.
class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}

class ChartData {
  ChartData({this.xValue, this.yValue});
  ChartData.fromMap(Map<String, dynamic> dataMap)
      : xValue = dataMap['ts'],
        yValue = dataMap['temperatura'].parseInt();
  final String xValue;
  final double yValue;
  }