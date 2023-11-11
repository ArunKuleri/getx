// ignore_for_file: unnecessary_null_comparison, camel_case_types

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/updateController.dart';
import 'package:get/get.dart';

class editStudent extends StatefulWidget {
  const editStudent({super.key});
  @override
  State<editStudent> createState() => _editStudent();
}

class _editStudent extends State<editStudent> {
  List<String> division = ['A', 'B', 'C', 'D', 'E'];
  String? selecteddivision;
  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');
  TextEditingController studentName = TextEditingController();
  TextEditingController studentPhone = TextEditingController();

  String? docId;
  void updatestudent(docId, name, number, division) {
    final data = {
      'name': name,
      'phone number': number,
      'division': division,
    };
    log(data.toString());

    student.doc(docId).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments as Map;
    if (data != null) {
      studentName.text = data['name'].toString();
      studentPhone.text = data['phone number'].toString();
      selecteddivision = data['division'].toString();
      final docId = data['id'];

      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: studentName,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: studentPhone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      label: Text("division"),
                    ),
                    value: selecteddivision,
                    items: division.map((String division) {
                      return DropdownMenuItem(
                          value: division,
                          child: Text(
                            division.toString(),
                          ));
                    }).toList(),
                    onChanged: (String? newValue) {
                      selecteddivision = newValue;
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  updatestudent(
                    docId,
                    studentName.text,
                    studentPhone.text,
                    selecteddivision,
                  );
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
    } else {
      return const Center(
        child: Text("Invalid or missing arguments"),
      );
    }
  }
}
