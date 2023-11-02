import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/otp/otp_model.dart';
import 'package:flutter_application_1/view/studentd/otpScreen.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signInWithPhone(String phoneNmber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNmber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Get.to((OtpScreen(verificationId: verificationId)));
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(e.message.toString() as GetSnackBar);
    }
  }

  void verifyOtp({
    required String verificaionId,
    // ignore: non_constant_identifier_names
    required String UserOtp,
    required Function onSuccess,
    required BuildContext context,
  }) async {
    _isLoading = true;
    update();
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: verificaionId,
        smsCode: UserOtp,
      );
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      update();
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(e.message.toString() as GetSnackBar);
      _isLoading = false;
      update();
    }
  }
}
