// ignore_for_file: prefer_const_constructors
import 'package:figma_design/utils/images.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.red,
            size: 28,
          ),
        ),
        title: Text(
          "Quotes",
          style: TextStyle(
              color: Colors.red,
              fontFamily: "lato",
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: quotes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
          itemBuilder: (context, index) {
            bool selectindex = false;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectindex = true;
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Item Is Clieked")));
                });
              },
              child: SizedBox(
                height: 112,
                width: 112,
                child: Image.network(
                  quotes[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
