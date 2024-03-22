import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class AddUserontroller extends GetxController {
  void addStudent(
    studentName,
    studendPhone,
    List<String> division,
  ) {
    String? selecteddivision;
    final CollectionReference student =
        FirebaseFirestore.instance.collection('student');
    TextEditingController studentName = TextEditingController();
    TextEditingController studentPhone = TextEditingController();
    final data = {
      'name': studentName.text,
      'phone number': studentPhone.text,
      'division': selecteddivision
    };
    student.add(data);
  }
}
