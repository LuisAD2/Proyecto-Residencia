import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';

class MonitorUpdate extends StatefulWidget {
  MonitorUpdate({Key key}) : super(key: key);
  @override
  _MonitorUpdateState createState() => _MonitorUpdateState();
}

class _MonitorUpdateState extends State<MonitorUpdate> {
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('node2').limitToLast(24);
  }

  Widget _buildNodoItem({Map nodo}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.cyan),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.watch_later_outlined,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Fecha y hora(UTC):  ") + nodo['ts'],
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.thermostat,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ('Temperatura:  ') + nodo['temperatura'] + ("°C"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.water,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Humedad:  ") + nodo['humedad'] + ("%"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_upward_outlined,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Altitud:  ") + nodo['altitud'] + (" M.s.n.m"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_circle_down_sharp,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Presión: ") + nodo['hpa'] + (" hPa"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.cloud_circle,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Monóxido de carbono(CO):  ") + nodo['ppmCO'] + (" ppm"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.group_work_outlined,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Ozono(O3):  ") + nodo['ppmO3'] + (" ppm"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.blur_on,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Partículas Suspendidas(PM1):  ") + nodo['pm1'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.blur_circular_rounded,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Partículas Suspendidas(PM2.5):  ") + nodo['pm2_5'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.bubble_chart_outlined,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Partículas Suspendidas(PM10):  ") + nodo['pm10'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 16,
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
        title: Text('Registro 24 Horas'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map nodo2 = snapshot.value;
              return _buildNodoItem(nodo: nodo2);
            }),
      ),
    );
  }
}
