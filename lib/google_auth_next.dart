// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class DataAuth extends StatefulWidget {
  final String name;
  final String email;
  final String imagurl;
  const DataAuth(
      {super.key,
      required this.name,
      required this.email,
      required this.imagurl});

  @override
  State<DataAuth> createState() => _DataAuthState();
}

class _DataAuthState extends State<DataAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(widget.imagurl),
            ),
          ),
          SizedBox(height: 30),
          Text(widget.name),
          SizedBox(height: 30),
          Text(widget.email),
        ],
      ),
    );
  }
}
