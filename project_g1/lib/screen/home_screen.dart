import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:project_g1/providers/button_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController latitude = TextEditingController();
  TextEditingController longtitude = TextEditingController();
  TextEditingController result = TextEditingController();
  late double LAT;
  late double LONG;
  @override
  void initState() {
    super.initState();
    result.text = "No any Lat and Long input...";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppBar(
        title: Text("HomePage"),
      ),
      Center(
        child: Column(children: [
          Text(result.text),
          ElevatedButton(
              onPressed: () {
                LAT = 222;
                LONG = 222;

                setState(() {
                  result.text = "Lattitude: ${LAT} // Longtitude: ${LONG}";
                });
              },
              child: Text("Button-1")),
/*
            
              onPressed: () {
                var latitude = 111;
                var longtitude = 111;
                LAT = 111;
                LONG = 111;
                setState(() {
                  result.text =
                      "Lattitude: ${latitude} // Longtitude: ${longtitude}";
                });
              },
              child: Text("Button-1")),
         
         */

          ElevatedButton(
              onPressed: () {
                var latitude = 222;
                var longtitude = 222;

                setState(() {
                  result.text =
                      "Lattitude: ${latitude} // Longtitude: ${longtitude}";
                });
              },
              child: Text("Button-2")),
          ElevatedButton(
              onPressed: () {
                var latitude = 333;
                var longtitude = 333;

                setState(() {
                  result.text =
                      "Lattitude: ${latitude} // Longtitude: ${longtitude}";
                });
              },
              child: Text("Button-3")),
          ElevatedButton(
              onPressed: () {
                var latitude = 444;
                var longtitude = 444;

                setState(() {
                  result.text =
                      "Lattitude: ${latitude} // Longtitude: ${longtitude}";
                });
              },
              child: Text("Button-4")),
        ]),
      )
    ]);
  }
}
