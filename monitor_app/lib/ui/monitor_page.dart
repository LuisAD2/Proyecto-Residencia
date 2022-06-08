import 'dart:core';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/models/nodo.dart';
import 'package:monitor_app/widgets/graphic_co.dart';
import 'package:monitor_app/widgets/graphic_hpa.dart';
import 'package:monitor_app/widgets/graphic_humedad.dart';
import 'package:monitor_app/widgets/graphic_o3.dart';
import 'package:monitor_app/widgets/graphic_pm1.dart';
import 'package:monitor_app/widgets/graphic_pm10.dart';
import 'package:monitor_app/widgets/graphic_pm2.dart';
import 'package:monitor_app/widgets/graphic_temp.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//icon: FaIcon(FontAwesomeIcons.gamepad),

class MonitorPage extends StatefulWidget {
  MonitorPage({this.app});
  final FirebaseApp app;

  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage>
    with SingleTickerProviderStateMixin {
  List<Nodo> nodos = List.empty(); //nuevo linea
  Nodo nodo; //nueva linea
  TabController _tabController;
  int tabIndex = 0;

  final referenceDatase = FirebaseDatabase.instance;

  Query _monitorRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // nueva linea

  @override
  void initState() {
    super.initState();
    //nodo = Nodo("", "");
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _monitorRef = database.reference().child('node2').limitToLast(12);
    _tabController = TabController(length: 8, vsync: this);
    /*_monitorRef.once().then((DataSnapshot snap){
      var data = snap.value();
    });*/
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Gráficas 12 Horas'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.redAccent, Colors.orange]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Humedad"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Temperatura"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Presión"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("CO"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("O3"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("PM1"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("PM2.5"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("PM10"),
                ),
              ),
            ]),
      ),
      body: StreamBuilder(
        stream: _monitorRef.onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            print("snapshot data: ${snap.data.snapshot.value.toString()}");
            return IndexedStack(
              index: tabIndex,
              children: [
                //_humedadLayout(context),
                GraphicHumedad(),
                GraphicTemp(),
                GraphicHpa(),
                GraphicCo(),
                GraphicO3(),
                GraphicPm1(),
                GraphicPm2(),
                GraphicPm10(),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }
        },
      ),
    );
  }

 /* Widget _humedadLayout(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<Event>(
                stream: _monitorRef.onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snap) {
                  Widget widget;
                  if (snap.hasData) {
                    List<ChartData> chartData = <ChartData>[];
                    Map data = snap.data.snapshot.value;
                    for (Map childData in data.values) {
                      // here we are storing the data into a list which is used for chart’s data source
                      chartData.add(
                          ChartData.fromMap(childData.cast<String, dynamic>()));
                          //print(chartData);
                    }
                    widget = Container(
                        child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries<ChartData, dynamic>>[
                        LineSeries<ChartData, dynamic>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.xValue,
                            yValueMapper: (ChartData data, _) => data.yValue)
                      ],
                    ));
                  }
                  return widget;
                },
              )),
            ],
          ),
        )),
      ),
    );
  }*/

}

/*class ChartData {
  ChartData({this.xValue, this.yValue});
  ChartData.fromMap(Map<String, dynamic> dataMap)
      : xValue = dataMap['ts'],
        yValue = dataMap['humedad'].parseInt();
  final String xValue;
  final double yValue;
  }*/
