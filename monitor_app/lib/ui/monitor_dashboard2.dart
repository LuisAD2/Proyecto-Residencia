import 'package:firebase_database/firebase_database.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';

class MonitorDashboard2 extends StatefulWidget {
  MonitorDashboard2({Key key}) : super(key: key);

  @override
  _MonitorDashboard2State createState() => _MonitorDashboard2State();
}

class _MonitorDashboard2State extends State<MonitorDashboard2> {
  Query _monitor;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _monitor =
        FirebaseDatabase.instance.reference().child('node2').limitToLast(1);
  }

  Widget _buildItems({Map nod}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 880,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(
                Icons.watch_later_outlined,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 200,
              ),
              Text(
                ("Fecha y hora(UTC):  ") + nod['ts'],
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
                width: 200,
              ),
          Divider(),
          Column(
            children: [
              Icon(
                Icons.thermostat,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ('Temperatura:  ') + nod['temperatura'] + ("°C"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Icon(
                Icons.water,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Humedad:  ") + nod['humedad'] + ("%"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Icon(
                Icons.arrow_upward_outlined,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Altitud: ") + nod['altitud'] + (" M.s.n.m"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Icon(
                Icons.arrow_circle_down_sharp,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Presión: ") + nod['hpa'] + (" hPa"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
           Column(
            children: [
              Icon(
                Icons.cloud_circle,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Monóxido de carbono(CO):  ") + nod['ppmCO'] + (" ppm"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
           Column(
            children: [
              Icon(
                Icons.group_work_outlined,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Ozono(O3):  ") + nod['ppmO3'] + (" ppm"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
           Column(
            children: [
              Icon(
                Icons.blur_on,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Partículas Suspendidas(PM1):  ") + nod['pm1'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
           Column(
            children: [
              Icon(
                Icons.blur_circular_rounded,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Partículas Suspendidas(PM2.5):  ") + nod['pm2_5'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(),
           Column(
            children: [
              Icon(
                Icons.bubble_chart_outlined,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Partículas Suspendidas(PM10):  ") + nod['pm10'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 18,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Datos en tiempo real Nodo2'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          shrinkWrap: true,
          query: _monitor,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map nod2 = snapshot.value;
            return _buildItems(nod: nod2);
          },
        ),
      ),
    );
  }
}
