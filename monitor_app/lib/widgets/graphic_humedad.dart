//import 'package:charts_flutter/flutter.dart';
import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: unused_import
import 'package:charts_flutter/flutter.dart' as charts;

class GraphicHumedad  extends StatefulWidget {
  @override
  _GraphicHumedadState createState() => _GraphicHumedadState();
}

class _GraphicHumedadState extends State<GraphicHumedad> {

  // ignore: unused_field
  Query _refNod2;

 List<SalesData> _chartData;
 var _tooltipBehavior;

 @override
 void initState() {
   _chartData = getChartData(); 
     _tooltipBehavior = TooltipBehavior(enable: true);
     _refNod2 =
           FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
      super.initState();
    }
   
     /// Create one series with sample hard coded data.
     List<SalesData> getChartData() {
       final List<SalesData> chartData = [
         SalesData(12,50.24),
         SalesData(13,48.58),
         SalesData(14,47.34),
         SalesData(15,45.59),
         SalesData(16,44.39),
         SalesData(17,41.63),
         SalesData(18,34.23),
         SalesData(19,32.9),
         SalesData(20,36.96),
         SalesData(21,32.81),
         SalesData(22,28.97),
         SalesData(23,27.07),
       ];
       return chartData;
     }
   
     @override
     Widget build(BuildContext context) => Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         child: SafeArea(
           child: Column(
             children: [
               Expanded(
                 child: SfCartesianChart(
                   title: ChartTitle(text: "Comportamiento Humedad"),
                   legend: Legend(isVisible: true),
                   tooltipBehavior: _tooltipBehavior,
                   series: <ChartSeries>[
                     LineSeries<SalesData, double>(
                       name: "Humedad(%)",
                       dataSource: _chartData,
                       xValueMapper: (SalesData sales,_)=>sales.year,
                       yValueMapper: (SalesData sales,_)=>sales.sales,
                       dataLabelSettings: DataLabelSettings(isVisible:true),
                       enableTooltip: true
                       )
                   ],
                   primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                   primaryYAxis: NumericAxis(labelFormat: '{value}%')
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
        yValue = dataMap['humedad'].parseInt();
  final String xValue;
  final double yValue;
  }
