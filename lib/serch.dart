import 'dart:convert';

import 'package:figma_design/Model/wallpapermedel.dart';
import 'package:figma_design/data/data.dart';
import 'package:figma_design/widget/textcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SerchScreen extends StatefulWidget {
  final String serchQuery;
  const SerchScreen({required this.serchQuery, super.key});

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  List<PhotosModel> wallpapers = [];
  TextEditingController serchcontoll = TextEditingController();

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
    getSerchwallpaper(widget.serchQuery);
    super.initState();
    serchcontoll.text = widget.serchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppName(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: serchcontoll,
                      decoration: const InputDecoration(
                          hintText: "search wallpaper",
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        getSerchwallpaper(serchcontoll.text);
                      },
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            WallpaperList(wallpapers: wallpapers, context: context)
          ],
        ),
      ),
    );
  }
}
