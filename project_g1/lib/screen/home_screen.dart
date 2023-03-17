import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:project_g1/screen/from_screen.dart';
import 'package:provider/provider.dart';
import 'package:project_g1/model/Location.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FromScreen();
                }));
              },
            )
          ],
        ),
        body: Consumer(builder: (context, LocationProvider provider, child) {
          return ListView.builder(
              itemCount: provider
                  .location.length, //นับจำนวนข้อมูลใน location_provider.dart
              itemBuilder: (context, int index) {
                Location data = provider.location[
                    index]; //ดึงข้อมูลทีละตัวจาก location_provider.dart
                Text("Set_1");
                return Card(
                  elevation: 3, // drop_shadow

                  margin: const EdgeInsets.all(5), //ห่างจากขอบ 4 ทิศทาง
                  child: ListTile(
                    onLongPress: () {
                      print(data.locationname);
                      print(data.lattitude);
                      print(data.longtitude);
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
