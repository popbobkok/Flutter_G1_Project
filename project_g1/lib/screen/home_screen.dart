import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:project_g1/providers/button_provider.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:project_g1/model/Location.dart';

import '../routes/routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController(); //รับชื่อ
  TextEditingController latController = TextEditingController(); //รับ lattitude
  TextEditingController longController =
      TextEditingController(); //รับ longtitude

  Map<String, dynamic> _controller = new Map();
  Map<String, dynamic> _controller2 = new Map();
  Map<String, dynamic> _controller3 = new Map();

  @override
  void dispose() {
    nameController.dispose();
    latController.dispose();
    longController.dispose();

    super.dispose();
  }

  @override
  void clear() {
    _controller.clear();
    _controller2.clear();
    _controller3.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Consumer(builder: (context, LocationProvider provider, child) {
          return ListView.builder(
              itemCount: provider
                  .location.length, //นับจำนวนข้อมูลใน location_provider.dart
              itemBuilder: (context, int index) {
                Location data = provider.location[
                    index]; //ดึงข้อมูลทีละตัวจาก location_provider.dart
                return Card(
                  elevation: 3, // drop_shadow

                  margin: const EdgeInsets.all(5), //ห่างจากขอบ 4 ทิศทาง
                  child: ListTile(
                    /*onTap: () {
                      print(data.locationname);
                      print(data.lattitude);
                      print(data.longtitude);
                    },*/
                    onLongPress: () {
                      clear();
                      print(data.locationname);
                      print(data.lattitude);
                      print(data.longtitude);

                      _controller.putIfAbsent(
                          data.locationname, () => Text("failed"));
                      _controller2.putIfAbsent(
                          data.lattitude, () => Text("failed"));

                      _controller3.putIfAbsent(
                          data.longtitude, () => Text("failed"));

                      child:
                      TextField(
                          //controller: _controller[data.locationname],
                          //_controller2[data.lattitude],
                          //_controller3[data.longtitude],
                          );

                      print(_controller);
                      print(_controller2);
                      print(_controller3);

                      Navigator.of(context).pushNamed(RouteManager.GpsPage);
                    },
                    leading: CircleAvatar(
                        child: FittedBox(
                      child: Text("300"),
                    )),
                    title: Text(data.locationname),
                    subtitle: Text("LAT: " +
                        data.lattitude.toString() +
                        " // LONG: " +
                        data.longtitude.toString()),
                  ),
                );
              });
        }));
  }
}
