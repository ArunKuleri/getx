// ignore_for_file: empty_catches, avoid_print

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> currentUser = Rx<User?>(null);
  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      currentUser.value = user;
    });
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  Future<void> signWithAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
