import 'package:flutter/cupertino.dart';

class Item extends StatelessWidget {
  Item({super.key});
  List produtname = ["Gold Chain", "Velure pouf", "Halmar chair"];
  List price = ["\$ 299", "\$ 199", "\$ 399"];

  List image = [
    "assets/images/LOLOLOLO-removebg-preview 1.png",
    "assets/images/image 2.png",
    "assets/images/image 3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.0,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(right: 10, left: 20),
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 246, 246, 1),
                  borderRadius: BorderRadius.circular(22)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(image[index]),
                    ),
                    Text(
                      produtname[index],
                      style: const TextStyle(fontFamily: "Inter", fontSize: 16),
                    ),
                    Text(
                      price[index],
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
