import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicO3 extends StatefulWidget{
  @override
  _GraphicO3State createState() => _GraphicO3State();
}

class _GraphicO3State extends State<GraphicO3> {

  // ignore: unused_field
  Query _refNod2;
  
  List<SalesData> _chartData4;
  var _tooltipBehavior4;

  @override
 void initState() {
  _chartData4 = getChartData(); 
    _tooltipBehavior4 = TooltipBehavior(enable: true);
    _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,1.755),
        SalesData(13,1.786),
        SalesData(14,0.046),
        SalesData(15,1.838),
        SalesData(16,0.049),
        SalesData(17,0.049),
        SalesData(18,0.047),
        SalesData(19,0.048),
        SalesData(20,0.048),
        SalesData(21,0.050),
        SalesData(22,0.051),
        SalesData(23,0.052),
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
                  title: ChartTitle(text: "Comportamiento Ozono"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior4,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "Ozono(O3)",
                      color: Colors.cyan,
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
        yValue = dataMap['ppmO3'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}