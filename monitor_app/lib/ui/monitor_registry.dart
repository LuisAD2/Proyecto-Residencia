import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_app/widgets/navigation_drawer.dart';

class MonitorRegistry extends StatefulWidget {

  @override
  _MonitorRegistryState createState() => _MonitorRegistryState();
}

class _MonitorRegistryState extends State<MonitorRegistry> {
  Query _nodo1ref;

  @override
  void initState() {
    super.initState();
    _nodo1ref = FirebaseDatabase.instance.reference().child('node1').limitToLast(24);
  }

  Widget _buildnodo1ItemUno({Map nodo1}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 340,
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
                ("Fecha y hora(UTC):  ") + nodo1['ts'],
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
                ('Temperatura:  ') + nodo1['Temp'] + ("°C"),
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
                ("Humedad:  ") + nodo1['Hum'] + ("%"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.arrowsAlt,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Dirección del Viento:  ") + nodo1['DV'] + ("°"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.cloudShowersHeavy,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Precipitación: ") + nodo1['Precip'] + (" mm"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.wind,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Velocidad del Viento:  ") + nodo1['VV'] + (" km/h"),
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
                ("Monóxido de carbono(CO):  ") + nodo1['CO'] + (" ppm"),
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
                ("Ozono(O3):  ") + nodo1['O3'] + (" ppm"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.spinner,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Dióxido de nitrógeno(NO2):  ") + nodo1['NO2'] + (" ppm"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.empire,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Dióxido de azufre(SO2):  ") + nodo1['SO2'] + (" ppm"),
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
                ("Partículas Suspendidas(PM1):  ") + nodo1['PM1'] + (" µg/m3"),
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
                ("Partículas Suspendidas(PM2.5):  ") + nodo1['PM2_5'] + (" µg/m3"),
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
                ("Partículas Suspendidas(PM10):  ") + nodo1['PM10'] + (" µg/m3"),
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.batteryHalf,
                //color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                ("Carga batería:  ") + nodo1['mVB'] + (" mV"),
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
            query: _nodo1ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map nodo1 = snapshot.value;
              return _buildnodo1ItemUno(nodo1: nodo1);
            }),
      ),
    );
  }
}