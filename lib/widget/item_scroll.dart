import 'package:flutter/material.dart';

class ScrollItem extends StatefulWidget {
  const ScrollItem({super.key});

  @override
  State<ScrollItem> createState() => _ScrollItemState();
}

class _ScrollItemState extends State<ScrollItem> {
  List selectedIndex = [];

  List lables = ["All", "Chairs", "Lamps", "Clocks", "cand"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: ListView.builder(
          itemCount: lables.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isselected = selectedIndex.contains(index);
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isselected) {
                      selectedIndex.remove(index);
                    } else {
                      selectedIndex.add(index);
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 70,
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Text(
                      lables[index],
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: isselected
                              ? const Color.fromRGBO(108, 142, 120, 1)
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: isselected
                          ? const Color.fromRGBO(228, 237, 234, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
