// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

class SingleProductModel {
  SingleProductModel({
    this.data,
  });

  List<SingleProductData>? data;

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
        data: json["data"] == null
            ? null
            : List<SingleProductData>.from(
                json["data"].map((x) => SingleProductData.fromJson(x))),
      );
}

class SingleProductData {
  SingleProductData({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.quantity,
    this.photos,
  });

  int? id;
  String? name;
  String? description;
  String? price;
  String? discount;
  String? quantity;
  List<SingleDataPhoto>? photos;

  factory SingleProductData.fromJson(Map<String, dynamic> json) =>
      SingleProductData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        photos: json["photos"] == null
            ? null
            : List<SingleDataPhoto>.from(
                json["photos"].map((x) => SingleDataPhoto.fromJson(x))),
      );
}

class SingleDataPhoto {
  SingleDataPhoto({
    this.id,
    this.productId,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productId;
  String? url;
  dynamic createdAt;
  dynamic updatedAt;

  factory SingleDataPhoto.fromJson(Map<String, dynamic> json) =>
      SingleDataPhoto(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        url: json["url"] == null ? null : json["url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
