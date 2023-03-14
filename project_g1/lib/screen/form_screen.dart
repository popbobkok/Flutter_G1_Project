import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_g1/model/Location.dart';
import 'package:project_g1/providers/location_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //controller
  final nameController = TextEditingController(); //รับค่าข้อมูล location name
  final latController = TextEditingController(); //รับค่าข้อมูล lattitude
  final longController = TextEditingController(); //รับค่าข้อมูล longtitude

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Location Page",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "Location Name: "),
                  autofocus: true,
                  controller: nameController, //เก็บค่าใน controller
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Latititude: "),
                  keyboardType: TextInputType.number,
                  controller: latController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Longtitude: "),
                  keyboardType: TextInputType.number,
                  controller: longController,
                ),
                ElevatedButton(
                  child: Text("submit"),
                  onPressed: () {
                    var name = nameController.text;
                    var lat = latController.text;
                    var long = longController.text;
                    print(name);
                    print(lat);
                    print(long);

                    //prepare data
                    Location locate = Location(
                      locationname: name,
                      lattitude: double.parse(lat),
                      longtitude: double.parse(lat),
                    );

                    //call location provider
                    var provider =
                        Provider.of<LocationProvider>(context, listen: false);
                    provider.addLocation(locate);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
