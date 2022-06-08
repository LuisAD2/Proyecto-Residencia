import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monitor_app/models/navigation_page.dart';
import 'package:monitor_app/src/views/mapview.dart';
import 'package:flutter/services.Dart';
import 'package:after_layout/after_layout.dart';

//import 'package:monitor_app/src/views/fullscreenmap.dart';
//import 'package:monitor_app/ui/monitor_page.dart';

//import 'monitor_page.dart';
//import 'monitor_update.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >=600;
    if(!isTablet){
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  void handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NavigationPage(),
      ),
    );
  }

  void NavigationPress(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MapView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcome.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/sep.png',
                      height: 30,
                    ),
                    Image.asset(
                      'assets/logotecnm.png',
                      height: 40,
                    ),
                    Image.asset(
                      'assets/logoTNL.png',
                      height: 40,
                    ),
                    Image.asset(
                      'assets/logoits.png',
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 230.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    //Image.asset(
                    //'assets/logotecnm.png',
                    //height: 50,
                    //),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      '¡Hola \nBienvenido!'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'Rubik',
                          color: Colors.black54,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '¿Qué te parece si empezamos a \nmonitorear la calidad ambiental?',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: Text('Monitorear'),
                      onPressed: () => handleNavigatePress(context),
                    ),
                    IconButton(
                      color: const Color(0xff8991e35),
                      icon: FaIcon(FontAwesomeIcons.mapMarked),
                      iconSize: 30.0,
                      onPressed: () => NavigationPress(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
