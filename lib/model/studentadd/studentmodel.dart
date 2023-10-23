import 'dart:io';

class Student {
  final String name;
  final String dob;
  final String course;
  final String age;
  final String address;
  final File? profilepicture;

  Student({
    required this.name,
    required this.dob,
    required this.course,
    required this.age,
    required this.address,
    this.profilepicture,
  });
}
