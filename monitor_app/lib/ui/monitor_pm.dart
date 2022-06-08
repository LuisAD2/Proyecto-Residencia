import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonitorPm extends StatefulWidget {

  @override
  _MonitorPmState createState() => _MonitorPmState();
}

class _MonitorPmState extends State<MonitorPm> {

  // ignore: unused_field
  Query _refNod2;

  List<ExpenseData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable:true);
    _refNod2 =
        FirebaseDatabase.instance.reference().child('node2').limitToLast(12);
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
      ExpenseData("12",59,4,2),
      ExpenseData("13",90,2,2),
      ExpenseData("14",90,2,2),
      ExpenseData("15",90,2,6),
      ExpenseData("16",90,2,7),
      ExpenseData("17",90,2,4),
      ExpenseData("18",90,2,2),
      ExpenseData("19",90,2,4),
      ExpenseData("20",90,2,2),
      ExpenseData("21",90,2,8),
      ExpenseData("22",90,2,6),
      ExpenseData("23",90,2,4),
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