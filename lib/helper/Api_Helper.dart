import 'dart:convert';

import '../modal/Api_moda.dart';
import 'package:http/http.dart' as http;

class ApiCalling {
  ApiCalling._();

  static ApiCalling apiCalling = ApiCalling._();

  String api =
      'https://real-time-product-search.p.rapidapi.com/search?q=Nike&country=us&language=en&limit=300&sort_by=BEST_MATCH&product_condition=ANY&min_rating=ANY';

  Future<List<Product>> getProduct() async {
    List<Product> allProduct = [];

    http.Response response = await http.get(Uri.parse(api), headers: {
      'x-rapidapi-host': 'real-time-product-search.p.rapidapi.com',
      'x-rapidapi-key': '560709b69amsh10452e5f1d2a5e5p1a1a09jsn3d6027f9e6cb'
    });

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List allData = data['data'];
      allProduct = allData.map((e) => Product.fromJson(e)).toList();
    }

    return allProduct;
  }
}
