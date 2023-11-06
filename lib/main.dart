import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/utils/custom_themes.dart';
import 'package:flutter_application_1/view/addStudent/add.dart';
import 'package:flutter_application_1/view/addStudent/edit_student.dart';

import 'package:flutter_application_1/view/loginpage.dart';
import 'package:flutter_application_1/view/studentd/dashbord.dart';
import 'package:flutter_application_1/view/update/update.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var permission = await Permission.location.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.light,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return LoginPage();
          } else {
            return const Dashboard();
          }
        },
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/Dashboard', page: () => const Dashboard()),
        GetPage(name: '/add', page: () => const Adduser()),
        GetPage(name: '/editStudent', page: () => const editStudent()),
        GetPage(name: '/update', page: () => const UpdateUser()),
      ],
    );
  }
}
