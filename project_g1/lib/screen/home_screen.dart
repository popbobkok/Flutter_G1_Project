import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:project_g1/screen/form_screen.dart';
import 'tracking_page2.dart';
import 'package:provider/provider.dart';
import 'package:project_g1/model/Location.dart';
import 'package:project_g1/model/Location_change.dart';
import '../routes/routes.dart';
import 'tracking_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController(); //รับชื่อ
  var latController = TextEditingController(); //รับ lattitude
  var longController = TextEditingController(); //รับ longtitude

  @override
  void dispose() {
    nameController.dispose();
    latController.dispose();
    longController.dispose();

    super.dispose();
  }

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
                  return FormScreen();
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
                return Card(
                  elevation: 3, // drop_shadow

                  margin: const EdgeInsets.all(5), //ห่างจากขอบ 4 ทิศทาง
                  child: ListTile(
                    onLongPress: () {
                      print(data.locationname);
                      print(data.lattitude);
                      print(data.longtitude);
                      controller:
                      if (index == 0) {
                        var route = new MaterialPageRoute(
                            builder: (BuildContext context) => new TrackingPage(
                                value_locate: data.locationname,
                                value_lat: data.lattitude,
                                value_lon: data.longtitude));
                        Navigator.of(context).push(route);
                      }
                      if (index == 1) {
                        var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new TrackingPage2(
                                    value_locate: data.locationname,
                                    value_lat: data.lattitude,
                                    value_lon: data.longtitude));
                        Navigator.of(context).push(route);
                      }
                    },
                    leading: CircleAvatar(
                        child: FittedBox(
                            //child: Text("POINT"),
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
