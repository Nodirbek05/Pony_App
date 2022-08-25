// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) =>
    FavoriteModel.fromJson(json.decode(str));

class FavoriteModel {
  FavoriteModel({
    this.products,
  });

  List<FavoriteProduct>? products;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        products: List<FavoriteProduct>.from(
            json["products"].map((x) => FavoriteProduct.fromJson(x))),
      );
}

class FavoriteProduct {
  FavoriteProduct({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.quantity,
    this.photos,
    this.options,
  });

  int? id;
  String? name;
  String? description;
  String? price;
  String? discount;
  String? quantity;
  List<Option>? photos;
  List<Option>? options;

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) =>
      FavoriteProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        discount: json["discount"],
        quantity: json["quantity"],
        photos:
            List<Option>.from(json["photos"].map((x) => Option.fromJson(x))),
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );
}

class Option {
  Option({
    this.id,
    this.productId,
    this.optionTypeId,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  int? id;
  String? productId;
  String? optionTypeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        optionTypeId: json["option_type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        url: json["url"],
      );
}
