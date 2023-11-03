import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/chat/chat.dart';
import 'package:flutter_application_1/view/studentd/dashbord.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class tutors extends StatelessWidget {
  const tutors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T U T O R S"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg?w=740"),
                radius: 70,
                child: Text(
                  "",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 35,
              child: TextButton(
                onPressed: () {
                  Get.to(() => Chat());
                },
                child: const Text("FLUTTER"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-vector/businessman-avatar-illustration-cartoon-user-portrait-user-profile-icon_118339-5502.jpg?w=740"),
                radius: 70,
              ),
            ),
            SizedBox(
              height: 35,
              child: TextButton(
                onPressed: () {
                  Get.to(() => Chat());
                },
                child: const Text("MEARN"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/pop-art-fashion-beautiful-woman-cartoon_18591-52376.jpg?w=740&t=st=1698990879~exp=1698991479~hmac=b24d17949b13322fdba53376e988d4f65b51ce75f6b7b02699a6e81c047ccc55"),
                radius: 70,
              ),
            ),
            SizedBox(
              height: 35,
              child: TextButton(
                onPressed: () {
                  Get.to(() => Chat());
                },
                child: const Text("MEAN"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-vector/illustration-beautiful-woman-with-different-facial-expression_96037-546.jpg?w=1060"),
                radius: 70,
              ),
            ),
            SizedBox(
              height: 35,
              child: TextButton(
                onPressed: () {
                  Get.to(() => Chat());
                },
                child: const Text("PYTHON DJANGO"),
              ),
            ),
            const Row(
              children: [Padding(padding: EdgeInsets.all(16.0))],
            )
          ],
        ),
      ),
    );
  }
}
