import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:project_g1/providers/button_provider.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:project_g1/screen/gps_screen.dart';
import 'package:provider/provider.dart';
import 'package:project_g1/model/Location.dart';
import 'package:project_g1/model/Location_change.dart';
import 'package:project_g1/screen/MapSample.dart';
import '../routes/routes.dart';

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
                      print(data.locationname);
                      print(data.lattitude);
                      print(data.longtitude);
                      controller:

                      //Navigator.of(context).pushNamed(RouteManager.GpsPage);

                      var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new GPS_Screen(
                              value_locate: data.locationname,
                              value_lat: data.lattitude,
                              value_lon: data.longtitude));
                      //Navigator.of(context).push(route);

                      var route2 = new MaterialPageRoute(
                          builder: (BuildContext context) => new MapSample(
                              value_locate: data.locationname,
                              value_lat: data.lattitude,
                              value_lon: data.longtitude));
                      Navigator.of(context).push(route2);
                    },
                    leading: CircleAvatar(
                        child: FittedBox(
                      child: Text("POINT"),
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

/*
class NextPage extends StatefulWidget {
  final String value_locate;
  final String value_lat;
  final String value_lon;
  const NextPage(
      {super.key,
      required this.value_locate,
      required this.value_lat,
      required this.value_lon});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: [
        Text("NExtPage"),
        Text("${widget.value_locate} ${widget.value_lat} ${widget.value_lon}")
      ],
    );
  }
}
*/