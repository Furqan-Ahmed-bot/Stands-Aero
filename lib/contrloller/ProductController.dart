import 'package:get/get.dart';
import 'package:stande_aero/helper/ProductModel.dart';
import 'package:stande_aero/helper/model.dart';
import 'package:stande_aero/services/remote_services.dart';

class ProductController extends GetxController {
  List<product> productList = <product>[].obs;
  void addProduct(product data) {
    productList.add(data);
    update();
  }
}
