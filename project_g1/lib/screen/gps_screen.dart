import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_g1/model/Location.dart';
import 'package:project_g1/model/Location_change.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:project_g1/routes/routes.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

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
      Consumer(builder: (context, LocationProvider provider, child) {
        return ListView.builder(
            itemCount: provider
                .location.length, //นับจำนวนข้อมูลใน location_provider.dart
            itemBuilder: (context, int index) {
              Location data = provider
                  .location[index]; //ดึงข้อมูลทีละตัวจาก location_provider.dart

              return Card(
                elevation: 3, // drop_shadow
                margin: const EdgeInsets.all(5), //ห่างจากขอบ 4 ทิศทาง
                child: ListTile(
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
      })

      /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Consumer<Location_change>(
              builder: (context, value, child) {
                return Text('Name: ${value.locationName}');
              },
            )
          ],
        ),
      )*/
    ]);
  }
}
