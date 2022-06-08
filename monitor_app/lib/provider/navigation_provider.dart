import 'package:flutter/material.dart';
import 'package:monitor_app/models/navigation_item.dart';

class NavigationProvider extends ChangeNotifier{
  NavigationItem _navigationItem = NavigationItem.nodo1;

  NavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem){
    _navigationItem = navigationItem;
    notifyListeners();
  }

}