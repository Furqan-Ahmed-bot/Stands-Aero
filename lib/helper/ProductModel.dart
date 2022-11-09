// To parse this JSON data, do
//
// final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.status,
    required this.data,
    required this.error,
  });

  bool status;
  List<product> data;
  List<dynamic> error;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        data: List<product>.from(json["data"].map((x) => product.fromJson(x))),
        error: List<dynamic>.from(json["error"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": List<dynamic>.from(error.map((x) => x)),
      };
}

class product {
  product({
    required this.id,
    required this.name,
    required this.sku,
    required this.category_name,
    required this.thumbnail,
    required this.location,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String sku;
  String category_name;
  String thumbnail;
  String location;
  String desc;
  String createdAt;
  String updatedAt;

  factory product.fromJson(Map<String, dynamic> json) => product(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        category_name: json["category_name"],
        thumbnail: json["thumbnail"],
        location: json["location"] == null ? null : json["location"],
        desc: json["desc"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "category_name": category_name,
        "thumbnail": thumbnail,
        "location": location == null ? null : location,
        "desc": desc,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
