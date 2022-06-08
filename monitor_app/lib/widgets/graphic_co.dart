import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';


class GraphicCo extends StatefulWidget {
  @override
  _GraphicCoState createState() => _GraphicCoState();
}

class _GraphicCoState extends State<GraphicCo> {

  // ignore: unused_field
  Query _refNod2;

  List<SalesData> _chartData3;
  var _tooltipBehavior3;

  @override
 void initState() {
  _chartData3 = getChartData(); 
    _tooltipBehavior3 = TooltipBehavior(enable: true);
    _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,106.6),
        SalesData(13,106.89),
        SalesData(14,8.59),
        SalesData(15,107.7),
        SalesData(16,8.71),
        SalesData(17,8.87),
        SalesData(18,8.66),
        SalesData(19,8.50),
        SalesData(20,8.48),
        SalesData(21,9.47),
        SalesData(22,10.02),
        SalesData(23,10.23),
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
        yValue = dataMap['ppmCO'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}