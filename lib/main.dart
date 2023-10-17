import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/view/loginpage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RxBool isDarkmode = false.obs;
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
        title: 'My App',
        theme: isDarkmode.value ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('login'),
            actions: [
              IconButton(
                icon:
                    Icon(isDarkmode.value ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  isDarkmode.toggle();
                },
              ),
            ],
          ),
          body: LoginPage(),
        )));
  }
}
