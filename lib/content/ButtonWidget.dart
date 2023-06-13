import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const CustomButon({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          // onPressed: () {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => Store()));
          // },
          onPressed: ontap,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
