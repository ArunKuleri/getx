import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/otp/otp_controller.dart';
import 'package:flutter_application_1/widgets/custombutton.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OTP"),
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 35),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                          width: 200,
                          height: 200,
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.people,
                            size: 150,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Verification",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Enter your OTP here",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: CustomButton(
                            onPressed: () {
                              if (otpCode != null) {
                                verifyOtp(otpCode!);
                              } else {
                                SnackBar(
                                  content: Text("enter 6 digit code"),
                                );
                              }
                            },
                            text: "Verify"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Resend code ?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ]))))));
  }

  verifyOtp(String userOtp) {
    final ap = Get.find<OtpController>();
  ap.verifyOtp(context:Get.context!, verificaionId: widget.verificationId, UserOtp: userOtp, onSuccess: (){ap.checkExistingUser().then((Value)async{if(Value==true){
    await ap.getDataFromFirestore
  }})})}
}
