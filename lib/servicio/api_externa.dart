import 'dart:developer';
import 'dart:convert';
import 'dart:async';


import 'package:app_jks/constants.dart';
import 'package:app_jks/modelo/producto_modelo.dart';
import 'package:http/http.dart';

class ApiExterna {
  static Future<List<ProductModel>?> getProductos() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productosEndpoint);
      var response = await get(url);
      if (response.statusCode == 200) {
        List<ProductModel> _model = productModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}