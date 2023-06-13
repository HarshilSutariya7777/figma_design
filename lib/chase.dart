// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:figma_design/fullscreen.dart';
import 'package:figma_design/recent_screen.dart';
import 'package:figma_design/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Chese extends StatefulWidget {
  const Chese({super.key});

  @override
  State<Chese> createState() => _CheseState();
}

class _CheseState extends State<Chese> {
  File? _image;
  Future getCamereImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    final imagetemp = File(image.path);
    setState(() {
      _image = imagetemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: getCamereImage,
          child: Icon(Icons.camera_alt),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                  height: MediaQuery.of(context).size.height / 2.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullScreen()));
                      },
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              "https://i0.wp.com/quoteshindi.net/wp-content/uploads/2021/02/1-2.jpg?fit=700%2C750&ssl=1",
                            ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/hightr.svg",
                    height: 30,
                    color: Colors.red,
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
                    width: 25,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Recent",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecentScreen()));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount: 6,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisExtent: 130),
                itemBuilder: (context, index) => Image.network(
                  quotes[index],
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
