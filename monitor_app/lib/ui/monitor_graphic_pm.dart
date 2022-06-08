import 'package:flutter/material.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';

class MonitorGraphicPm extends StatefulWidget {
  @override
  _MonitorGraphicPmState createState() => _MonitorGraphicPmState();
}

class _MonitorGraphicPmState extends State<MonitorGraphicPm> {

  // ignore: unused_field
  Query _refNod1;

   List<ExpenseData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable:true);
    _refNod1 =
        FirebaseDatabase.instance.reference().child('node1').limitToLast(12);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Gráficas PMs'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
         width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SfCartesianChart(
                title: ChartTitle(text: "Comportamiento PM1, PM2.5, PM10"),
                legend: Legend(isVisible:true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  StackedLineSeries<ExpenseData,String>(
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData exp, _)=>exp.expenseCategory,
                    yValueMapper: (ExpenseData exp, _)=>exp.pm1,
                    name: "PM1",
                    markerSettings: MarkerSettings(isVisible:true)
                  ),
                  StackedLineSeries<ExpenseData,String>(
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData exp, _)=>exp.expenseCategory,
                    yValueMapper: (ExpenseData exp, _)=>exp.pm2,
                    name:"PM2.5",
                    markerSettings: MarkerSettings(isVisible:true)
                  ),
                  StackedLineSeries<ExpenseData,String>(
                    dataSource: _chartData,
                    xValueMapper: (ExpenseData exp, _)=>exp.expenseCategory,
                    yValueMapper: (ExpenseData exp, _)=>exp.pm10,
                    name:"PM10",
                    markerSettings: MarkerSettings(isVisible:true)
                  ),
                ],
                primaryXAxis: CategoryAxis(),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  List<ExpenseData>getChartData(){
    final List<ExpenseData> chartData = [
      ExpenseData("1",0,26,53),
      ExpenseData("2",0,25,52),
      ExpenseData("3",0,24,52),
      ExpenseData("4",0,26,55),
      ExpenseData("5",0,26,56),
      ExpenseData("6",0,26,52),
      ExpenseData("7",0,21,51),
      ExpenseData("8",0,26,52),
      ExpenseData("9",0,23,55),
      ExpenseData("10",0,26,57),
      ExpenseData("11",6,20,40),
      ExpenseData("12",5,27,55),
    ];
    return chartData;
  }
}

class ExpenseData{
  ExpenseData(this.expenseCategory, this.pm1, this.pm2, this.pm10);
  final String expenseCategory;
  final num pm1;
  final num pm2;
  final num pm10;
}

