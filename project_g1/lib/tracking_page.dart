import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_g1/components/constants.dart';

import 'screen/home_screen.dart';

class TrackingPage extends StatefulWidget {
  //ยอดดอยปุย
  final String value_locate;
  final double value_lat;
  final double value_lon;
  const TrackingPage(
      {super.key,
      required this.value_locate,
      required this.value_lat,
      required this.value_lon});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation =
      LatLng(18.83190150489986, 98.88783444824068); //selected location
  static const LatLng destination =
      LatLng(18.801509396823917, 98.95057447934234); //CMU location
  static const LatLng check1 =
      LatLng(18.825930324486652, 98.89361991113627); //chk1 ก่อแป้น
  static const LatLng check2 =
      LatLng(18.82592027515902, 98.89343513105128); //chk2 สนสามใบ
  static const LatLng check3 =
      LatLng(18.8263159716337, 98.89320944826582); //chk3 มะกอกห้ารู
  static const LatLng check4 =
      LatLng(18.82636674590299, 98.8928022617592); //chk4 ก่อหัวหมูหลวง
  static const LatLng check5 =
      LatLng(18.826230816875437, 98.89271731758171); //chk5 นางพญาเสือโคร่ง
  static const LatLng check6 =
      LatLng(18.82616050721207, 98.89257273292371); //chk6 ตองแตบ
  static const LatLng check7 =
      LatLng(18.826180816940425, 98.8925834617592); //chk7 มะซัก
  static const LatLng check8 =
      LatLng(18.82683550641637, 98.89110215991067); //chk8 อบเชย
  static const LatLng check9 =
      LatLng(18.826805816128093, 98.89015580408825); //chk9 พี้พ่าย
  static const LatLng check10 =
      LatLng(18.830355038399553, 98.88898877525277); //chk10 สารภีป่า
  static const LatLng check11 =
      LatLng(18.82592027515902, 98.89343513105128); //chk11 มณฑาแดง

  List<LatLng> polylineCoordinates = [];

  //LocationData? currentLocaiton;

  void getCurrentLocaiton() async {
    Location location = Location();
/*
    GoogleMapController googleMapController = await _controller.future;

    location.getLocation().then(
      (location) {
        currentLocaiton = location;
      },
    );

    location.onLocationChanged.listen((newLoc) {
      currentLocaiton = newLoc;
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ))));
      setState(() {});
    });*/
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(
            point.latitude,
            point.longitude,
          ),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    //getCurrentLocaiton();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Track Location",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: /*currentLocaiton == null
            ? const Center(child: Text("loading"))
           : */
            GoogleMap(
          initialCameraPosition: CameraPosition(
            target: sourceLocation,
            //target: LatLng(currentLocaiton!.latitude!, currentLocaiton!.longitude!),
            zoom: 14.5,
          ),
          polylines: {
            Polyline(
              polylineId: PolylineId("route"),
              points: polylineCoordinates,
              color: primaryColor,
              width: 6,
            ),
          },
          markers: {
            /*
            Marker(
              markerId: const MarkerId("currentLocation"),
              position: destination,
            ),*/
            const Marker(
              markerId: MarkerId("source"),
              position: sourceLocation,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check1,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check2,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check3,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check4,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check5,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check6,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check7,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check8,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check9,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check10,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: check11,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: destination,
            ),
          },
          onMapCreated: (mapController) {
            _controller.complete(mapController);
          },
        ));
  }
}
