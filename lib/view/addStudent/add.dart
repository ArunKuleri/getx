import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/Loction/place_location.dart';
import 'package:flutter_application_1/controller/todo_controller/add_user_controller/add_user_controler.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});
  @override
  State<Adduser> createState() => _AddUserState();
}

class _AddUserState extends State<Adduser> {
  final PlaceLocation placeLocation = Get.put(PlaceLocation());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // String? _currentAddress;
  // Position? _currentPosition;
  // Future<bool> _handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //             'Location services are disabled . Please enabled the services')));
  //     // return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Location permissions are denied")));
  //       // return false;
  //     }
  //   } else if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             "Location permissions are permanently denied, we cannot request permissions")));
  //     // return false;
  //   } else {
  //     return true;
  //   }
  //   return false;
  // }

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //       _getAddressFromLatLng(_currentPosition!);
  //     });
  //   });
  // }

  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddress =
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //     });
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  final division = ['A', 'B', 'C', 'D', 'E'];
  String? selecteddivision;
  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');
  TextEditingController studentName = TextEditingController();
  TextEditingController studentPhone = TextEditingController();
  final AddUserontroller addUserontroller = Get.put(AddUserontroller());
  // void addStudent() {
  //   final data = {
  //     'name': studentName.text,
  //     'phone number': studentPhone.text,
  //     'division': selecteddivision
  //   };
  //   student.add(data);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Users"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextField(
                controller: studentName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Name")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      controller: placeLocation.studentPhone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "LAT: ${placeLocation.currentPosition?.latitude ?? ""}",
                          semanticsLabel:
                              "LNG:${placeLocation.currentPosition?.longitude ?? ""}",
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => placeLocation.getCurrentPosition(),
                    icon: Icon(Icons.pin_drop),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: studentPhone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("location"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField(
                    decoration:
                        const InputDecoration(label: Text("Select division")),
                    items: division
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      selecteddivision = value;
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  addUserontroller.addStudent(
                      studentName, studentPhone, division);
                  formKey.currentState!.reset();
                  Get.back();
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50))),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
