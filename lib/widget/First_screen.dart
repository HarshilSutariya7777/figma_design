import 'package:figma_design/secon_screen.dart';
import 'package:figma_design/utils/text.dart';
import 'package:figma_design/widget/item.dart';
import 'package:figma_design/widget/item_scroll.dart';
import 'package:flutter/material.dart';

List selectedIndex = [];

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentIndex = 0;
  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: ontap,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    "assets/images/Vector.png",
                  ),
                  color: Colors.black,
                ),
                label: "hi"),
            const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Vector (1).png"),
                  color: Colors.black,
                ),
                label: "hi"),
            const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Vector (2).png"),
                  color: Colors.black,
                ),
                label: "hi"),
            const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Vector (3).png"),
                  color: Colors.black,
                ),
                label: "hi"),
            const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Vector (5).png"),
                  color: Colors.black,
                ),
                label: "hi"),
          ]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 23,
                left: 23,
                right: 23,
              ),
              child: Text(
                AppText().main,
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: "Inter",
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondScreen()));
                  },
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 25,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(108, 142, 120, 1),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Stack(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  left: 35,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      AppText().containertext,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Inter",
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppText().price,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Inter",
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 170,
                    margin: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: Image.asset(
                      "assets/images/chair.png",
                    ),
                  ),
                ),
              ],
            ),
            ScrollItem(),
            Item(),
          ],
        ),
      ),
    );
  }
}
