import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_g1/routes/routes.dart';

class GPSScreen extends StatefulWidget {
  const GPSScreen({super.key});

  @override
  State<GPSScreen> createState() => _GPSScreenState();
}

class _GPSScreenState extends State<GPSScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppBar(title: Text("GPS_screen"), actions: [
        IconButton(
          onPressed: () {
            //Navigator.of(context).pushNamed(RouteManager.HomePage);
            Navigator.pop(context);
          },
          icon: Icon(Icons.exit_to_app),
        )
      ]),
      Center(
        child: Text("GPS_SCREEN"),
      )
    ]);
  }
}
