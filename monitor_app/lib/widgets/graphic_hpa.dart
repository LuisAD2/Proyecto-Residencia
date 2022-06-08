import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicHpa extends StatefulWidget {
  @override
  _GraphicHpaState createState() => _GraphicHpaState();
}

class _GraphicHpaState extends State<GraphicHpa> {
  // ignore: unused_field
  Query _refNod2;

  List<SalesData> _chartData2;
  var _tooltipBehavior2;

  @override
 void initState() {
  _chartData2 = getChartData(); 
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    _refNod2 =
          FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
     super.initState();
   }
  
   /// Create one series with sample hard coded data.
    List<SalesData> getChartData() {
      final List<SalesData> chartData = [
        SalesData(12,819.6),
        SalesData(13,819.97),
        SalesData(14,820.08),
        SalesData(15,819.87),
        SalesData(16,819.76),
        SalesData(17,819.51),
        SalesData(18,819.02),
        SalesData(19,818.69),
        SalesData(20,818.34),
        SalesData(21,817.95),
        SalesData(22,817.48),
        SalesData(23,817.09),
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
                  title: ChartTitle(text: "Comportamiento Presión"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior2,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                      name: "Presión(hPa)",
                      color: Colors.green,
                      dataSource: _chartData2,
                      xValueMapper: (SalesData sales,_)=>sales.year,
                      yValueMapper: (SalesData sales,_)=>sales.sales,
                      dataLabelSettings: DataLabelSettings(isVisible:true),
                      enableTooltip: true
                      )
                  ],
                  primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                  primaryYAxis: NumericAxis(labelFormat: '{value}hPa')
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
        yValue = dataMap['hpa'].parseInt();
  final String xValue;
  final double yValue;
  }

/// Sample linear data type.
class SalesData {
  final double year;
  final double sales;
  SalesData(this.year, this.sales);
}
