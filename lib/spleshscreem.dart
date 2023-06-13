// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:figma_design/main.dart';
import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => First())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              heightFactor: 2,
              child: SizedBox(
                height: 350,
                width: 350,
                child: Image.asset("assets/images/image 3.png"),
              ),
            ),
            Text(
              "Furniture App",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter"),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Powerd by Furniture wala",
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: "Inter"),
            ),
          ],
        ),
      ),
    );
  }
}
