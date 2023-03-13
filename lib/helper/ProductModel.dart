// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

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
    required this.thumbnail,
    required this.location,
    required this.address,
    required this.desc,
    required this.categoryId,
    required this.manufacturerId,
    required this.categoryName,
    required this.manufacturerName,
    required this.status,
    required this.color,
    required this.availableStatus,
  });

  int id;
  String name;
  String sku;
  String thumbnail;
  String location;
  String address;
  String desc;
  String categoryId;
  String manufacturerId;
  String categoryName;
  String manufacturerName;
  String status;
  String color;
  String availableStatus;

  factory product.fromJson(Map<String, dynamic> json) => product(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        thumbnail: json["thumbnail"],
        location: json["location"],
        address: json["address"],
        desc: json["desc"],
        categoryId: json["category_id"],
        manufacturerId: json["manufacturer_id"],
        categoryName: json["category_name"],
        manufacturerName: json["manufacturer_name"],
        status: json["status"],
        color: json["color"],
        availableStatus: json["available_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "thumbnail": thumbnail,
        "location": location,
        "address": address,
        "desc": desc,
        "category_id": categoryId,
        "manufacturer_id": manufacturerId,
        "category_name": categoryName,
        "manufacturer_name": manufacturerName,
        "status": status,
        "color": color,
        "available_status": availableStatus,
      };
}
