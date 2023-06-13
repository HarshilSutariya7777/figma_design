import 'dart:convert';

import 'package:figma_design/Model/wallpapermedel.dart';
import 'package:figma_design/data/data.dart';
import 'package:figma_design/widget/textcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryView extends StatefulWidget {
  final String categoryName;
  const CategoryView({required this.categoryName, super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<PhotosModel> wallpapers = [];

  getSerchwallpaper(String serch) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$serch&per_page=30&page=1"),
        headers: {"Authorization": apikey});

    // print(response.body.toString());

    Map<String, dynamic> jsondata = jsonDecode(response.body);
    jsondata["photos"].forEach((element) {
      debugPrint(element);
      PhotosModel photosModel = PhotosModel(
          url: "",
          photographer: "",
          photographerUrl: "",
          src: SrcModel(portrait: "", landscape: "", large: "", medium: ""));

      // PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      wallpapers.add(photosModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSerchwallpaper(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppName(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          WallpaperList(wallpapers: wallpapers, context: context)
        ]),
      ),
    );
  }
}
