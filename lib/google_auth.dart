import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figma_design/google_auth_next.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  googleLogin() async {
    log("Google Login call");
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userdata = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userdata.accessToken, idToken: userdata.idToken);
      debugPrint("Creditional :$credential");
      var finalresult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      try {
        var response =
            await FirebaseFirestore.instance.collection("userlist").add({
          'user_name': result.displayName,
          'PhotoUrl': result.photoUrl,
          'email': result.email,
          'user_uid': result.id,
          'Date': DateTime.now().microsecondsSinceEpoch,
        });
        debugPrint("Firebase Database response:$response");
      } catch (e) {
        debugPrint("Error Saving data in storage $e");
      }
      debugPrint("Result: $result");
      debugPrint("name: ${result.displayName}");
      debugPrint("photo: ${result.photoUrl}");
      debugPrint("email: ${result.email}");

      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataAuth(
                  name: result.displayName.toString(),
                  email: result.email,
                  imagurl: result.photoUrl.toString())));
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: googleLogin,
                  child: const Text(
                    "Google Auth",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: logout,
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
