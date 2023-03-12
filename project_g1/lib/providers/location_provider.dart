import 'package:flutter/material.dart';

import '../model/Location.dart';

class LocationProvider with ChangeNotifier {
  List<Location> location = [
    Location(locationname: "ปลายทาง-A", lattitude: 111.11, longtitude: 222.22),
    Location(locationname: "ปลายทาง-B", lattitude: 33.3, longtitude: 4.444),
    Location(locationname: "ปลายทาง-C", lattitude: 5.55, longtitude: 6666.666),
    Location(
        locationname: "ปลายทาง-D", lattitude: 1245123, longtitude: 512412.521),
    Location(locationname: "ปลายทาง-E", lattitude: 421.12, longtitude: 5123.12),
    Location(locationname: "ปลายทาง-F", lattitude: 312, longtitude: 123),
  ];

  List<Location> getLocation() {
    return location;
  }

  void addLocation(Location pinpoint) {
    location.add(pinpoint);
  }
}
