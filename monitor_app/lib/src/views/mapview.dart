import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

class MapView extends StatefulWidget {
  MapView({Key key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
        ),
      body: FlutterMap(
        options: MapOptions(
            center: LatLng(25.4433, -100.994),
            zoom: 16.0),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(25.443567, -100.993248),
                builder: (ctx) => Container(
                  child: IconButton(
                      tooltip: "Nodo 1",
                      icon: FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.red[800],
                      size: 36.0,
                    ),
                    onPressed: (){},
                  ),
                  
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(25.445834464403944, -100.99433523649704),
                builder: (ctx) => Container(
                  child: IconButton(
                      tooltip: "Nodo 2",
                      icon: FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.blue[800],
                      size: 36.0,
                    ),
                  onPressed: (){
                    return Container(child: Text("Nodo 2"),);
                  },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
