import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_g1/components/constants.dart';

import 'screen/home_screen.dart';

class TrackingPage2 extends StatefulWidget {
  //ถ้ำฤาษี suy
  final String value_locate;
  final double value_lat;
  final double value_lon;
  const TrackingPage2(
      {super.key,
      required this.value_locate,
      required this.value_lat,
      required this.value_lon});

  @override
  State<TrackingPage2> createState() => _TrackingPage2State();
}

class _TrackingPage2State extends State<TrackingPage2> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(
      18.806589047742058, 98.91085752432996); //selected location chk0 ลำพูป่า
  static const LatLng destination =
      LatLng(18.801509396823917, 98.95057447934234); //CMU location
  static const LatLng check1 =
      LatLng(18.80656951591912, 98.91126658384961); //chk1 ไทรย้อยใบทู่
  static const LatLng check2 =
      LatLng(18.806504672030258, 98.91144236850755); //chk2 ขี้หนอนคาย
  static const LatLng check3 =
      LatLng(18.806280452597814, 98.91148341083648); //chk3 ดีหมี
  static const LatLng check4 =
      LatLng(18.806074984567775, 98.91167278384967); //chk4 มณฑาขาว
  static const LatLng check5 =
      LatLng(18.80599451637066, 98.9115879396731); //chk5 กอมขน
  static const LatLng check6 =
      LatLng(18.805753111637713, 98.91157721083651); //chk6 มะกอกฟราน
  static const LatLng check7 =
      LatLng(18.805633579990314, 98.91191116850759); //chk7 แคหางด่าง
  static const LatLng check8 =
      LatLng(18.805653892198144, 98.91212012617864); //chk8 ประยงค์ป่า
  static const LatLng check9 =
      LatLng(18.805763267734605, 98.91222268200102); //chk9 หม่อนหลวง
  static const LatLng check10 =
      LatLng(18.805843735997847, 98.91234866850756); //chk10 เติม
  static const LatLng check11 =
      LatLng(18.805743736046104, 98.91242189734308); //chk11 จำปาป่า

  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocaiton;

  void getCurrentLocaiton() async {
    Location location = Location();

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
    });
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
    getCurrentLocaiton();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Location: ยอดดอยปุย",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: currentLocaiton == null
            ? const Center(child: Text("loading..."))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocaiton!.latitude!, currentLocaiton!.longitude!),
                  zoom: 13.5,
                ),
                polylines: {
                  Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: abitharder,
                    width: 6,
                  ),
                },
                markers: {
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: LatLng(currentLocaiton!.latitude!,
                        currentLocaiton!.longitude!),
                  ),
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
