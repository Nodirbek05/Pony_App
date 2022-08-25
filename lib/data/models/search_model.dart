

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

class SearchModel {
  SearchModel({
    this.data,
  });

  SearchData? data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: SearchData.fromJson(json["data"]),
      );
}

class SearchData {
  SearchData({
    this.product,
    this.category,
    this.brand,
  });

  List<SearchProduct>? product;
  List<dynamic>? category;
  List<SearchBrand>? brand;

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        product: List<SearchProduct>.from(
            json["product"].map((x) => SearchProduct.fromJson(x))),
        category: List<dynamic>.from(json["category"].map((x) => x)),
        brand: List<SearchBrand>.from(
            json["brand"].map((x) => SearchBrand.fromJson(x))),
      );
}

class SearchBrand {
  SearchBrand({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SearchBrand.fromJson(Map<String, dynamic> json) => SearchBrand(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class SearchProduct {
  SearchProduct({
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

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
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
