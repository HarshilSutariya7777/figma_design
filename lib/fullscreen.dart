// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
          ),
        ),
        title: Text(
          "Today Quotes",
          style: TextStyle(
              color: Color.fromRGBO(192, 46, 23, 1),
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato"),
        ),
        actions: [
          SvgPicture.asset(
            "assets/images/hightr.svg",
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://i0.wp.com/quoteshindi.net/wp-content/uploads/2021/02/1-2.jpg?fit=700%2C750&ssl=1",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/images/hightr.svg",
                  height: 30,
                ),
                SizedBox(
                  width: 28,
                ),
                SvgPicture.asset(
                  "assets/images/download.svg",
                  height: 30,
                ),
                SizedBox(
                  width: 28,
                ),
                SvgPicture.asset(
                  "assets/images/share.svg",
                  height: 30,
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/images/bookmark.svg",
                  height: 30,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
