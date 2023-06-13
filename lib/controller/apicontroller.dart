import 'package:figma_design/Model/apimodel.dart';
import 'package:figma_design/services/Remotesevices.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    fetchproduct();
    super.onInit();
  }

  var productList = <MakupProduct>[].obs;

  void fetchproduct() async {
    var products = await productservice.fetchproduct();
    if (products != null) {
      productList.value = products;
    }
  }
}
