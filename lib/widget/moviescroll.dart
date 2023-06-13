import 'package:figma_design/widget/slider.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: ListView.builder(
        itemCount: imagemovie.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 150,
            child: Image.network(
              imagemovie[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
