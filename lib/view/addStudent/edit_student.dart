// ignore_for_file: unnecessary_null_comparison, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editStudent extends StatefulWidget {
  const editStudent({super.key});
  @override
  State<editStudent> createState() => _editStudent();
}

class _editStudent extends State<editStudent> {
  final division = ['A', 'B', 'C', 'D', 'E'];
  String? selecteddivision;
  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');
  TextEditingController studentName = TextEditingController();
  TextEditingController studentPhone = TextEditingController();
  String? docId;
  void updatetudent(docId) {
    final data = {
      'name': studentName.text,
      'phone number': studentPhone.text,
      'division': selecteddivision
    };
    student.doc(docId).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    if (arguments != null) {
      final division = arguments['division'].toString();
      final docId = arguments['id'];

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
                  maxLength: 10,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone Number")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField(
                    decoration:
                        const InputDecoration(label: Text("Select division")),
                    items: division
                        .split("")
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
                  updatetudent(docId);
                  Get.toNamed('/update');
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
    } else {
      return const Center(
        child: Text("Invalid or missing arguments"),
      );
    }
  }
}
