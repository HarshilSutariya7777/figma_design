import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/onbordingcontroller.dart';

class Onbording extends StatefulWidget {
  final String img;
  final String title;
  final String subtitle;
  const Onbording(this.img, this.title, this.subtitle);

  @override
  State<Onbording> createState() => _OnbordingState();
}

List<Onbording> content = [
  const Onbording("assets/images/chair.png", "Develop good habits",
      "Habits are fundamental part of our life.make the most of your life!!"),
  const Onbording("assets/images/image 2.png", "Track your progress",
      "Habits are fundamental part of our life.make the most of your life!!"),
  const Onbording("assets/images/image 3.png", "break bad habits",
      "Habits are fundamental part of our life.make the most of your life!!")
];

class _OnbordingState extends State<Onbording> {
  final obj = Get.put(onbordingController());
  PageController onbordingcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onbordingcontroller,
                onPageChanged: (int index) {
                  obj.currentIndex.value = index;
                },
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 400,
                          width: 500,
                          child: Image.asset(content[index].img),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          content[index].title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          content[index].subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  content.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 10,
                    width: obj.currentIndex.value == index ? 20 : 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: obj.currentIndex.value == index
                            ? Colors.blue
                            : Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {
                    if (obj.currentIndex.value == content.length - 1) {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => drawer(
                      //               Namee: '',
                      //               bio: '',
                      //               cours: '',
                      //               phone: '',
                      //             )));
                    }
                    onbordingcontroller.nextPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.linear);
                  },
                  child: Text(obj.currentIndex.value == content.length - 1
                      ? "Get Started"
                      : "Next"),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
