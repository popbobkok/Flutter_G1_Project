import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_g1/components/constants.dart';

import 'screen/home_screen.dart';

class TrackingPage4 extends StatefulWidget {
  //น้ำตกห้วยแก้ว easy
  final String value_locate;
  final double value_lat;
  final double value_lon;
  const TrackingPage4(
      {super.key,
      required this.value_locate,
      required this.value_lat,
      required this.value_lon});

  @override
  State<TrackingPage4> createState() => _TrackingPage4State();
}

class _TrackingPage4State extends State<TrackingPage4> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation =
      LatLng(18.81214373295127, 98.94159866850765); //selected location chk0 รัง
  static const LatLng destination =
      LatLng(18.801509396823917, 98.95057447934234); //CMU location
  static const LatLng check1 =
      LatLng(18.812063265829224, 98.94159955501426); //chk1 ยอป่า
  static const LatLng check2 =
      LatLng(18.81199764296055, 98.9413173685077); //chk2 เสม็ด
  static const LatLng check3 =
      LatLng(18.81181248724005, 98.9415155973432); //chk3 มะกอกป่า
  static const LatLng check4 =
      LatLng(18.811653110209438, 98.94150486850766); //chk4 รัก
  static const LatLng check5 =
      LatLng(18.81147811025182, 98.94172268200104); //chk5 มะกอกเกลื้อน
  static const LatLng check6 =
      LatLng(18.81147264299253, 98.94206835501417); //chk6 สะแล๋งหอมไก๋
  static const LatLng check7 =
      LatLng(18.811407798753248, 98.9421923685076); //chk7 คำมอกหลวง
  static const LatLng check8 =
      LatLng(18.811328110288162, 98.94243163967215); //chk8 เหี่ยง
  static const LatLng check9 =
      LatLng(18.81108748724039, 98.9429629396721); //chk9 เหมือดโลด
  static const LatLng check10 =
      LatLng(18.811557798735176, 98.9440576261787); //chk10 กระทุ่ม
  static const LatLng check11 =
      LatLng(18.81160702001123, 98.94478705501416); //chk11 กาสามปีก
  List<LatLng> polylineCoordinates = [];

  void getCurrentLocaiton() async {
    Location location = Location();
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
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Location: น้ำตกห้วยแก้ว",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: sourceLocation,
            zoom: 14.5,
          ),
          polylines: {
            Polyline(
              polylineId: PolylineId("route"),
              points: polylineCoordinates,
              color: easy,
              width: 6,
            ),
          },
          markers: {
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
