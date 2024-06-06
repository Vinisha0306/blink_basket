import 'package:blink_basket/helper/Api_Helper.dart';
import 'package:blink_basket/modal/Api_moda.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  List<Product> allProduct = [];

  ProductController() {
    loadData();
  }

  Future<void> loadData() async {
    allProduct = await ApiCalling.apiCalling.getProduct();
    notifyListeners();
  }
}
