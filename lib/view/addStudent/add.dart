import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/todo_controller/add_user_controller/add_user_controler.dart';
import 'package:get/get.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});
  @override
  State<Adduser> createState() => _AddUserState();
}

class _AddUserState extends State<Adduser> {
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
        child: Column(
          children: [
            TextField(
              controller: studentName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: studentPhone,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone Number")),
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
    );
  }
}
