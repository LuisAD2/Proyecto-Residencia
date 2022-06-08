import 'package:flutter/material.dart';
import 'package:monitor_app/models/navigation_item.dart';
import 'package:monitor_app/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.lightBlue[100],
          child: ListView(
            children: <Widget>[
              buildHeader(context),
              Container(
                padding: padding,
                child: Column(children: [
                  SizedBox(height: 24),
                  Text(
                    'NODO 1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  buildMenuItem(context,
                      item: NavigationItem.nodo1,
                      text: 'Datos en tiempo real',
                      icon: Icons.data_usage_rounded),
                  SizedBox(height: 24),
                  buildMenuItem(context,
                      item: NavigationItem.registro1,
                      text: 'Registro 24 Horas',
                      icon: Icons.receipt_long_outlined),
                  SizedBox(height: 24),
                  buildMenuItem(context,
                      item: NavigationItem.graficos1,
                      text: 'Gráficas 12 Horas',
                      icon: Icons.show_chart_sharp),
                  SizedBox(height: 24),
                  buildMenuItem(context,
                      item: NavigationItem.graficospm1,
                      text: 'Gráficas PMs',
                      icon: Icons.grain_rounded),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 15),
                  Text(
                    'NODO 2',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  buildMenuItem(context,
                      item: NavigationItem.nodo2,
                      text: 'Datos en tiempo real',
                      icon: Icons.data_usage_rounded),
                  SizedBox(height: 24),
                  buildMenuItem(context,
                      item: NavigationItem.registro2,
                      text: 'Registro 24 Horas',
                      icon: Icons.receipt_long_outlined),
                  SizedBox(height: 24),
                  buildMenuItem(context,
                      item: NavigationItem.graficos2,
                      text: 'Gráficas 12 Horas',
                      icon: Icons.show_chart_sharp),
                  SizedBox(height: 24),
                  buildMenuItem(context,
                      item: NavigationItem.graficospm2,
                      text: 'Gráficas PMs',
                      icon: Icons.grain_rounded),
                  SizedBox(height: 24),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    NavigationItem item,
    String text,
    IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;
    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: color, size: 25.0),
        title: Text(text, style: TextStyle(color: color, fontSize: 18)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.lightBlue[200],
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/aire.png"), radius:30),
              SizedBox(width: 16),
              Text(
                'Monitor App',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ],
          ),
        ),
      );
}
