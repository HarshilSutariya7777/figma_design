// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:figma_design/Model/category_model.dart';
import 'package:figma_design/Model/wallpapermedel.dart';
import 'package:figma_design/category.dart';
import 'package:figma_design/data/data.dart';
import 'package:figma_design/serch.dart';
import 'package:figma_design/widget/textcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WallPaper extends StatefulWidget {
  const WallPaper({super.key});

  @override
  State<WallPaper> createState() => _WallPaperState();
}

class _WallPaperState extends State<WallPaper> {
  List<CategorieModel> categories = [];
  List<PhotosModel> wallpapers = [];
  TextEditingController serchcontoll = TextEditingController();

  getTrendingwallpaper() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=&page=1"),
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
    getTrendingwallpaper();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: serchcontoll,
                        decoration: InputDecoration(
                            hintText: "search", border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SerchScreen(
                                        serchQuery: serchcontoll.text,
                                      )));
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imgUrls: categories[index].imgUrl,
                      title: categories[index].categorieName,
                    );
                  },
                ),
              ),
              WallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrls, title;
  const CategoryTile({required this.imgUrls, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryView(categoryName: title.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrls,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              )),
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )),
        ]),
      ),
    );
  }
}
