import 'dart:convert';

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.image_link,
  });

  int id;
  String brand;
  String name;
  String price;
  String image_link;


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    brand: json["brand"],
    name: json["name"],
    price: json["price"],
    image_link: json["image_link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "name": name,
    "price": price,
    "image_link": image_link,
  };
}