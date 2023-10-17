import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/user.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool showSignupForm = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: passwordController,
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
                        userController.signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: Text("Sign Up"),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        userController.signInWithEmailAndPassword(
                            emailController.text, passwordController.text);
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
                  ? 'I already Have an account'
                  : "Create An Account");
            }))
          ],
        ),
      ),
    );
  }
}
