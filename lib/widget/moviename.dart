// ignore_for_file: prefer_const_constructors

import 'package:figma_design/movielistfull.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  const Category({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FullList()));
            },
            child: Text(
              "More",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter"),
            ),
          ),
        ),
      ],
    );
  }
}
