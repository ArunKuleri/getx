import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/todo_controller/add_user_controller/add_user_controler.dart';
import 'package:flutter_application_1/widgets/image_picker.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/Loction/place_location.dart';

class Adduser extends StatelessWidget {
  Adduser({super.key});
  final PlaceLocation placeLocation = Get.put(PlaceLocation());

  final division = ['A', 'B', 'C', 'D', 'E'];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? selecteddivision;

  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');

  TextEditingController studentName = TextEditingController();

  TextEditingController studentPhone = TextEditingController();

  final AddUserontroller addUserontroller = Get.put(AddUserontroller());
  void addStudent() {
    final data = {
      'name': studentName.text,
      'phone number': studentPhone.text,
      'division': selecteddivision
    };
    student.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Users"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                UserImagePicker(),
                TextFormField(
                  controller: studentName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a value";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Name")),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: studentPhone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a value";
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone Number")),
                ),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: placeLocation.studentPhone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter a value";
                        }
                      },
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
                    icon: const Icon(Icons.pin_drop),
                  )
                ]),
                const SizedBox(height: 12),
                DropdownButtonFormField(
                    decoration:
                        const InputDecoration(label: Text("Select division")),
                    items: division
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      selecteddivision = newValue;
                    }),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) addStudent();
                    formKey.currentState!.reset();

                    Get.back();
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
