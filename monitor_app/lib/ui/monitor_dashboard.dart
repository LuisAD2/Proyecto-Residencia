import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MonitorDashboard extends StatefulWidget {
  @override
  _MonitorDashboardState createState() => _MonitorDashboardState();
}

class _MonitorDashboardState extends State<MonitorDashboard> {
  Query _nod1Ref;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _nod1Ref =
        FirebaseDatabase.instance.reference().child('node1').limitToLast(1);
  }

  Widget _buildItems1({Map nod1}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 1250,
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
                ("Fecha y hora(UTC):  ") + nod1['ts'],
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
                ('Temperatura:  ') + nod1['Temp'] + ("°C"),
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
                ("Humedad:  ") + nod1['Hum'] + ("%"),
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
              FaIcon(
                FontAwesomeIcons.arrowsAlt,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Dirección del Viento:  ") + nod1['DV'] + ("°"),
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
              FaIcon(
                FontAwesomeIcons.cloudShowersHeavy,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Precipitación: ") + nod1['Precip'] + (" mm"),
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
              FaIcon(
                FontAwesomeIcons.wind,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Velocidad del Viento:  ") + nod1['VV'] + (" km/h"),
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
                ("Monóxido de carbono(CO):  ") + nod1['CO'] + (" ppm"),
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
                ("Ozono(O3):  ") + nod1['O3'] + (" ppm"),
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
              FaIcon(
                FontAwesomeIcons.spinner,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Dióxido de nitrógeno(NO2):  ") + nod1['NO2'] + (" ppm"),
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
              FaIcon(
                FontAwesomeIcons.empire,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Dióxido de azufre(SO2):  ") + nod1['SO2'] + (" ppm"),
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
                ("Partículas Suspendidas(PM1):  ") + nod1['PM1'] + (" µg/m3"),
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
                ("Partículas Suspendidas(PM2.5):  ") + nod1['PM2_5'] + (" µg/m3"),
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
                ("Partículas Suspendidas(PM10):  ") + nod1['PM10'] + (" µg/m3"),
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
              FaIcon(
                FontAwesomeIcons.batteryHalf,
                //color: Theme.of(context).primaryColor,
                size: 50,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Carga batería:  ") + nod1['mVB'] + (" mV"),
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
        title: Text('Datos en tiempo real Nodo1'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          shrinkWrap: true,
          query: _nod1Ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map nod1 = snapshot.value;
            return _buildItems1(nod1: nod1);
          },
        ),
      ),
    );
  }
}
