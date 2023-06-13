import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamereOpen extends StatefulWidget {
  const CamereOpen({super.key});

  @override
  State<CamereOpen> createState() => _CamereOpenState();
}

class _CamereOpenState extends State<CamereOpen> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imagetemp = File(image.path);
    setState(() {
      _image = imagetemp;
    });
  }

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
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: _image != null
                  ? Image.file(
                      _image!,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      "https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg?w=2000",
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          const SizedBox(height: 20),
          customButton(
            ontap: getCamereImage,
            title: "Open Camera",
            icon: Icons.camera,
          ),
          const SizedBox(height: 10),
          customButton(
            ontap: getImage,
            title: "Open Gallery",
            icon: Icons.photo,
          ),
        ],
      ),
    );
  }
}

class customButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function ontap;

  const customButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ontap();
      },
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
