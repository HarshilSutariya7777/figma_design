// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:figma_design/ImageView.dart';
import 'package:figma_design/Model/wallpapermedel.dart';
import 'package:flutter/material.dart';

Widget AppName() {
  return Row(
    // ignore: prefer_const_literals_to_create_immutables
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // ignore: prefer_const_constructors
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}

Widget WallpaperList({List<PhotosModel>? wallpapers, context}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: wallpapers!.map((WallPaper) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ImageView(imgUrl: WallPaper.src.portrait)));
          },
          child: Hero(
            tag: WallPaper.src.portrait,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                WallPaper.src.portrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
