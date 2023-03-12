import 'package:flutter/material.dart';

class Location_change with ChangeNotifier {
  String _locationName = '';
  String _lattitude = '';
  String _longtitude = '';

  String get locationName => _locationName;
  String get lattitude => _lattitude;
  String get longtitude => _longtitude;

  set locationName(String location) {
    _locationName = location;
    notifyListeners();
  }

  set lattitude(String lattitude) {
    _lattitude = lattitude;
    notifyListeners();
  }

  set longtitude(String longttude) {
    _longtitude = longtitude;
    notifyListeners();
  }
}
