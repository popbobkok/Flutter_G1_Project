import 'package:flutter/material.dart';

import '../model/Location.dart';

class LocationProvider with ChangeNotifier {
  List<Location> location = [
    Location(
        locationname: "ยอดดอยปุย", lattitude: 18.831820, longtitude: 98.887840),
    Location(
        locationname: "ถ้ำฤาษี",
        lattitude: 19.026317610016154,
        longtitude: 98.950193619518),
    Location(
        locationname: "น้ำตกห้วยแก้ว",
        lattitude: 18.81208026885429,
        longtitude: 98.94461016989337),
    Location(
        locationname: "มะดะหลวง(ต้นไทรใหญ่)",
        lattitude: 18.810206227300785,
        longtitude: 98.91615231268527),
    //Location(locationname: "CMU", lattitude: 18.801509396823917, longtitude: 98.95057447934234),
    //Location(locationname: "ปลายทาง-F", lattitude: 312, longtitude: 123),
  ];

  List<Location> getLocation() {
    return location;
  }

  void addLocation(Location pinpoint) {
    location.add(pinpoint);
  }
}
