// ignore_for_file: prefer_const_constructors

import 'package:figma_design/utils/text.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

List mycolor = <Color>[
  Color.fromRGBO(43, 80, 57, 1),
  Color.fromRGBO(238, 199, 89, 1),
  Color.fromRGBO(55, 77, 153, 1),
  Color.fromRGBO(179, 169, 170, 1),
  Color.fromRGBO(34, 34, 34, 1),
];

Color primarycolor = mycolor[0];

class _SecondScreenState extends State<SecondScreen> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count < 1) {
      return;
    }
    setState(() {
      count--;
    });
  }

  int color = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(176, 181, 193, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(primarycolor, BlendMode.hue),
                      child: Image.asset(
                        "assets/images/image 3 (1).png",
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        AppText().secChair,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppText().longtext,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppText().color,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          for (var i = 0; i < 5; i++) buildIconBtn(mycolor[i]),
                          // ColorDot(
                          //   color: Color.fromRGBO(43, 80, 57, 1),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // ColorDot(
                          //   color: Color.fromRGBO(238, 199, 89, 1),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // ColorDot(
                          //   color: Color.fromRGBO(55, 77, 153, 1),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // ColorDot(
                          //   color: Color.fromRGBO(179, 169, 170, 1),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // ColorDot(
                          //   color: Color.fromRGBO(34, 34, 34, 1),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppText().quantitiy,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: decrement,
                              child: Icon(
                                Icons.remove,
                                size: 25,
                                color: Color.fromRGBO(108, 142, 120, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$count",
                            style: TextStyle(
                                color: Color.fromRGBO(108, 142, 120, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: increment,
                              child: Icon(
                                Icons.add,
                                size: 25,
                                color: Color.fromRGBO(108, 142, 120, 1),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            AppText().fprice,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Inner",
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 51,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(229, 238, 235, 1))),
                                onPressed: () {},
                                child: Text(
                                  AppText().fbtntxt,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(108, 142, 120, 1),
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(57, 101, 83, 1))),
                                onPressed: () {},
                                child: Text(
                                  AppText().secbtntxt,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildIconBtn(Color mycolor) => Stack(
        children: [
          Positioned(
            top: 12.5,
            left: 12.5,
            child: Icon(
              Icons.check,
              size: 20,
              color: primarycolor == mycolor ? mycolor : Colors.transparent,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.circle,
              color: mycolor.withOpacity(0.65),
              size: 30,
            ),
            onPressed: () {
              setState(() {
                primarycolor = mycolor;
              });
            },
          ),
        ],
      );
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelectd;
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelectd = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(
            color: isSelectd ? color : Colors.transparent,
          ),
          shape: BoxShape.circle),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
