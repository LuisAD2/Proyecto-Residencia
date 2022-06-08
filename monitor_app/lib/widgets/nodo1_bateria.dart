import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class Nodo1Bateria extends StatefulWidget {
  @override
  _Nodo1BateriaState createState() => _Nodo1BateriaState();
}

class _Nodo1BateriaState extends State<Nodo1Bateria> {

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
        SalesData(11,4154),
        SalesData(12,4156),
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
                  title: ChartTitle(text: "Comportamiento carga de la Bateria"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior7,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "Carga bateria",
                      color: Colors.red,
                      dataSource: _chartData7,
                      xValueMapper: (SalesData sales,_)=>sales.year,
                      yValueMapper: (SalesData sales,_)=>sales.sales,
                      dataLabelSettings: DataLabelSettings(isVisible:true),
                      enableTooltip: true
                      )
                  ],
                  primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                  primaryYAxis: NumericAxis(labelFormat: '{value}mV')
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
        yValue = dataMap['mVB'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final int sales;
  SalesData(this.year, this.sales);
}