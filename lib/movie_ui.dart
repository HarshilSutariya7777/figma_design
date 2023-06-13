// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_design/widget/moviename.dart';
import 'package:figma_design/widget/moviescroll.dart';
import 'package:figma_design/widget/slider.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Slider1(),
            Category(title: "Latest & Trending"),
            MovieList(),
            Category(title: "Action"),
            MovieList(),
            Category(title: "Comedy"),
            MovieList(),
            Category(title: "Drama"),
            MovieList(),
          ],
        ),
      ),
    );
  }
}
