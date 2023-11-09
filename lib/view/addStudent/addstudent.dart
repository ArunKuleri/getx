import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/addStudent/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});
  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');
  void deleteStudent(docId) {
    student.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Adduser(),
              ));
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: student.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot studentSnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Text(
                            studentSnap['division'].toString(),
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              studentSnap['name'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              studentSnap['phone number'].toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed('/editStudent', arguments: {
                                  'name': studentSnap['name'],
                                  'division':
                                      studentSnap['division'].toString(),
                                  'phone number':
                                      studentSnap['phone number'].toString(),
                                  'id': studentSnap.id,
                                });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 30,
                              color: Colors.blue,
                            ),
                            IconButton(
                              onPressed: () {
                                deleteStudent(studentSnap.id);
                              },
                              icon: const Icon(Icons.delete),
                              iconSize: 30,
                              color: Colors.red,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
