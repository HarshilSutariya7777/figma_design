import 'package:figma_design/controller/apicontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiCalled extends StatefulWidget {
  const ApiCalled({super.key});

  @override
  State<ApiCalled> createState() => _ApiCalledState();
}

class _ApiCalledState extends State<ApiCalled> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Obx((() => GridView.builder(
      //     itemCount: img.length,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //     ),
      //     itemBuilder: (context, index) => Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.amber,
      //             child: Image.asset(img[index]),
      //           ),
      //         )))));
      body: GridView.builder(
          itemCount: productController.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: Image.network(
                    productController.productList[index].imageLink,
                    fit: BoxFit.fill,
                  ),
                ),
              )),
    );
  }
}
