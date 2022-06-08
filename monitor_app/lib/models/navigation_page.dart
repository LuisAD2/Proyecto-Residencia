import 'package:flutter/material.dart';
import 'package:monitor_app/provider/navigation_provider.dart';
import 'package:monitor_app/ui/monitor_dashboard.dart';
import 'package:monitor_app/ui/monitor_dashboard2.dart';
import 'package:monitor_app/ui/monitor_graphic.dart';
import 'package:monitor_app/ui/monitor_graphic_pm.dart';
import 'package:monitor_app/ui/monitor_page.dart';
import 'package:monitor_app/ui/monitor_pm.dart';
import 'package:monitor_app/ui/monitor_registry.dart';
import 'package:monitor_app/ui/monitor_update.dart';
import 'package:provider/provider.dart';
import 'navigation_item.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context){
    return buildPages();
  } 

  
  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;
    

     switch (navigationItem) {
      case NavigationItem.nodo1:
        return MonitorDashboard();
      case NavigationItem.registro1:
        return MonitorRegistry();
      case NavigationItem.graficos1:
        return MonitorGraphic();
      case NavigationItem.graficospm1:
        return MonitorGraphicPm();
      case NavigationItem.nodo2:
        return MonitorDashboard2();
      case NavigationItem.registro2:
        return MonitorUpdate();
      case NavigationItem.graficos2:
        return MonitorPage();
      case NavigationItem.graficospm2:
        return MonitorPm();
    }
    return  MonitorDashboard();
  }
}