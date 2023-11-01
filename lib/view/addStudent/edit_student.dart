import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/toggle_controller.dart';
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
      String name = arguments['name'];
      String phoneNumber = arguments['phone number'].toString();
      String division = arguments['division'].toString();
      final docId = arguments['id'];
    }
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
                            child: Text(e),
                            value: e,
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
  }
}
