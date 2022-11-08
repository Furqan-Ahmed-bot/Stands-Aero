import 'package:get/get.dart';
import 'package:StandsAero/helper/ProductModel.dart';
import 'package:StandsAero/helper/model.dart';
import 'package:StandsAero/services/remote_services.dart';

class ProductController extends GetxController {
  List<product> productList = <product>[].obs;
  void addProduct(product data) {
    productList.add(data);
    update();
  }
}
