import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_g1/model/Location.dart';

class FromScreen extends StatefulWidget {
  const FromScreen({super.key});

  @override
  State<FromScreen> createState() => _FromScreenState();
}

class _FromScreenState extends State<FromScreen> {
  final nameController = TextEditingController();
  final latController = TextEditingController();
  final longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("add location page")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: new InputDecoration(labelText: "Location Name"),
                autofocus: true,
                controller: nameController, //keep input data to this
              ),
              TextField(
                decoration: new InputDecoration(labelText: "Lattitude"),
                keyboardType: TextInputType.number,
                controller: latController, //keep input data to this
              ),
              TextField(
                decoration: new InputDecoration(labelText: "Longtitude"),
                keyboardType: TextInputType.number,
                controller: longController, //keep input data to this
              ),
              ElevatedButton(
                child: Text("submit"),
                onPressed: () {
                  var name = nameController;
                  var lat = latController;
                  var long = longController;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
