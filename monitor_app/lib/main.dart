import 'package:flutter/material.dart';
import 'package:monitor_app/provider/navigation_provider.dart';
import 'package:monitor_app/ui/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
//import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'monitor_app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(), 
        home: HomePage(),
      ),
    );
  } 
}

