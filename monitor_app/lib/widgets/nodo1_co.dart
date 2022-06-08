import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class Nodo1Co extends StatefulWidget {
  @override
  _Nodo1CoState createState() => _Nodo1CoState();
}

class _Nodo1CoState extends State<Nodo1Co> {

  // ignore: unused_field
  Query _refNod1;

   List<SalesData> _chartData3;
  var _tooltipBehavior3;

  @override
 void initState() {
  _chartData3 = getChartData(); 
    _tooltipBehavior3 = TooltipBehavior(enable: true);
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
        SalesData(5,8.75),
        SalesData(6,8.81),
        SalesData(7,8.80),
        SalesData(8,8.77),
        SalesData(9,8.79),
        SalesData(10,8.65),
        SalesData(11,8.76),
        SalesData(12,8.80),
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
                  title: ChartTitle(text: "Comportamiento Monóxido de carbono"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior3,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "Monóxido(CO)",
                      color: Colors.amber,
                      dataSource: _chartData3,
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
        yValue = dataMap['CO'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}