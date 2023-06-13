// ignore_for_file: prefer_const_constructors

// import 'dart:ui';
import 'package:figma_design/widget/slider.dart';
import 'package:flutter/material.dart';

class FullList extends StatefulWidget {
  const FullList({super.key});

  @override
  State<FullList> createState() => _FullListState();
}

class _FullListState extends State<FullList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: imagemovie.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, index) => Image.network(
          imagemovie[index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
