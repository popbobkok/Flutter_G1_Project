import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_g1/components/constants.dart';

import 'screen/home_screen.dart';

class TrackingPage3 extends StatefulWidget {
  //ต้นไทรใหญ่ mediuam
  final String value_locate;
  final double value_lat;
  final double value_lon;
  const TrackingPage3(
      {super.key,
      required this.value_locate,
      required this.value_lat,
      required this.value_lon});

  @override
  State<TrackingPage3> createState() => _TrackingPage3State();
}

class _TrackingPage3State extends State<TrackingPage3> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(
      18.806629671924522, 98.91829689734307); //selected location chk0 มะขาม
  static const LatLng destination =
      LatLng(18.801509396823917, 98.95057447934234); //CMU location
  static const LatLng check1 =
      LatLng(18.806789827832684, 98.91826471083657); //chk1 กำลังเสือโคร่ง
  static const LatLng check2 =
      LatLng(18.80683357948238, 98.91829689734307); //chk2 บุนนาค
  static const LatLng check3 =
      LatLng(18.80735779924462, 98.9179326261786); //chk3 ยางปาย
  static const LatLng check4 =
      LatLng(18.807718735091132, 98.91714059734308); //chk4 มะยาง
  static const LatLng check5 =
      LatLng(18.807738267137424, 98.91706736850759); //chk5 สลีนก
  static const LatLng check6 =
      LatLng(18.807717955181236, 98.91710939734305); //chk6 ขี้อ้าย
  static const LatLng check7 =
      LatLng(18.808268734825184, 98.91698439734309); //chk7 พิกุลป่า
  static const LatLng check8 =
      LatLng(18.809778889945726, 98.91744236853734); //chk8 จำปีป่า
  static const LatLng check9 =
      LatLng(18.810032798920197, 98.91656736850767); //chk9 กร่าง
  static const LatLng check10 =
      LatLng(18.809988266456863, 98.91644236850765); //chk10 โมลี
  static const LatLng check11 =
      LatLng(18.809962487241133, 98.91609866850766); //chk11 มะดะหลวง

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
            "Loaction: ต้นไทรใหญ่",
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
              color: medium,
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
