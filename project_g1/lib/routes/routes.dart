import 'package:flutter/material.dart';
import 'package:project_g1/screen/home_screen.dart';

class RouteManager {
  static const String HomePage = '/';

  static const String GpsPage = "/gpspage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage:
        return MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );

      /* case GpsPage:
        return MaterialPageRoute(
          builder: (context) => GPSScreen(),
        );
*/
      default:
        throw FormatException("Routes not found!!");
    }
  }
}
