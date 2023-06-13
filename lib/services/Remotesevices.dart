import 'package:figma_design/Model/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class productservice {
  static var client = http.Client();

  static Future<List<MakupProduct>?> fetchproduct() async {
    var responce = await client.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      debugPrint(jsonString);
      return makupProductFromJson(jsonString);
    } else {
      return null;
    }
  }
}
