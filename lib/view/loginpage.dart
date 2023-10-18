import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/user.dart';
import 'package:flutter_application_1/view/studentd/dashbord.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool showSignupForm = false.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome!!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                Icon(
                  Icons.people,
                  size: 150,
                ),
                TextFormField(
                  controller: emailController,
                  validator: _validateEmail,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: _validatePassword,
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Obx(() {
                  return showSignupForm.value
                      ? ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              userController.signInWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                              );
                              Get.to(() => Dashboard());
                            }
                          },
                          child: Text("Sign Up"),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            userController.signInWithEmailAndPassword(
                                emailController.text, passwordController.text);
                            Get.to(() => Dashboard());
                          },
                          child: Text("sign in"),
                        );
                }),
                SizedBox(
                  height: 8.0,
                ),
                TextButton(onPressed: () {
                  showSignupForm.toggle();
                }, child: Obx(() {
                  return Text(showSignupForm.value
                      ? 'I already Have an account?'
                      : "Create An Account");
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
