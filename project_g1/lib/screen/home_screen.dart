import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController latitude = TextEditingController();
  TextEditingController longtitude = TextEditingController();
  TextEditingController result = TextEditingController();
  late int LAT;
  late int LONG;
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
