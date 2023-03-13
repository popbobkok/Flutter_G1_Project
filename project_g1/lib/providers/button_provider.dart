import 'package:flutter/material.dart';

class Button_L with ChangeNotifier {
  double _lat = 0;
  double _long = 0;

  double get change_lat => _lat;
  double get change_long => _long;

  set change_lat(double location_lat) {
    _lat = location_lat;
    notifyListeners();
  }

  set change_long(double location_long) {
    _long = location_long;
    notifyListeners();
  }

  void change_both(double a, double b) {
    change_lat = a;
    change_long = b;
    notifyListeners();
  }
}
