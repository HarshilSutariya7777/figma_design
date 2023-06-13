// ignore_for_file: prefer_const_constructors

import 'package:figma_design/camera.dart';
import 'package:figma_design/widget/otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

class OtpReceive extends StatefulWidget {
  const OtpReceive({super.key});

  @override
  State<OtpReceive> createState() => _OtpReceiveState();
}

class _OtpReceiveState extends State<OtpReceive> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController pinput = TextEditingController();
  var code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Text(
            "Enter 6 Digit code here",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Pinput(
            controller: pinput,
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            onChanged: (value) {
              code = value;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Resend Code it!!",
                style: TextStyle(fontSize: 18),
              )),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
            onPressed: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: Otp.verificationId, smsCode: pinput.text);

                await auth.signInWithCredential(credential);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CamereOpen()));
              } catch (e) {
                Get.snackbar("", "Invalid code!!",
                    colorText: Colors.white, backgroundColor: Colors.grey);
              }
            },
            child: Text(
              "Login In",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      )),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.amber),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(28, 129, 223, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);
