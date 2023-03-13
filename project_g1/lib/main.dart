import 'package:flutter/material.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:project_g1/screen/home_screen.dart';
import 'package:project_g1/tracking_page.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return LocationProvider();
        })
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          // '/gpspage': (context) => GPSScreen(),
        },
      ),
    );
  }
}
