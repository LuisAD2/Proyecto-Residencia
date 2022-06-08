import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';
import 'package:monitor_app/widgets/nodo1_bateria.dart';
import 'package:monitor_app/widgets/nodo1_co.dart';
import 'package:monitor_app/widgets/nodo1_no2.dart';
import 'package:monitor_app/widgets/nodo1_o3.dart';
import 'package:monitor_app/widgets/nodo1_pm1.dart';
import 'package:monitor_app/widgets/nodo1_pm10.dart';
import 'package:monitor_app/widgets/nodo1_pm2.dart';
import 'package:monitor_app/widgets/nodo1_so2.dart';

class MonitorGraphic extends StatefulWidget {

  @override
  _MonitorGraphicState createState() => _MonitorGraphicState();
}

class _MonitorGraphicState extends State<MonitorGraphic> with SingleTickerProviderStateMixin{

  TabController _tabController;
  int tabIndex = 0;

  Query _refNod1;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _refNod1 =
        FirebaseDatabase.instance.reference().child('node1').limitToLast(12);
        _tabController = TabController(length: 8, vsync: this);
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
                  child: Text("NO2"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("SO2"),
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
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Batería"),
                ),
              ),
            ]),
      ),
      body: StreamBuilder(
        stream: _refNod1.onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            //print("snapshot data: ${snap.data.snapshot.value.toString()}");
            return IndexedStack(
              index: tabIndex,
              children: [
                //_humedadLayout(context),
                Nodo1Co(),
                Nodo1O3(),
                Nodo1No2(),
                Nodo1So2(),
                Nodo1Pm1(),
                Nodo1Pm2(),
                Nodo1Pm10(),
                Nodo1Bateria(),
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
}