import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GPS_Screen extends StatefulWidget {
  final String value_locate;
  final String value_lat;
  final String value_lon;
  const GPS_Screen(
      {super.key,
      required this.value_locate,
      required this.value_lat,
      required this.value_lon});

  @override
  State<GPS_Screen> createState() => _GPS_Screen();
}

class _GPS_Screen extends State<GPS_Screen> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: [
        AppBar(title: Text("GPS_screen"), actions: [
          IconButton(
            onPressed: () {
              //Navigator.of(context).pushNamed(RouteManager.HomePage);
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ]),
        Text("NExtPage"),
        Text("${widget.value_locate} ${widget.value_lat} ${widget.value_lon}")
      ],
    );
  }
}
