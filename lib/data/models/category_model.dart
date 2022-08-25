// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  CategoryModel({
    this.data,
  });

  List<CategoryData>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: json["data"] == null
            ? null
            : List<CategoryData>.from(
                json["data"].map((x) => CategoryData.fromJson(x))),
      );
}

class CategoryData {
  CategoryData({
    this.id,
    this.name,
    this.photo,
    this.subCategories,
  });

  int? id;
  String? name;
  dynamic photo;
  List<SubCategories>? subCategories;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        subCategories: json["subCategories"] == null
            ? null
            : List<SubCategories>.from(
                json["subCategories"].map((x) => SubCategories.fromJson(x))),
      );
}

class SubCategories {
  int? id;
  String? name;
  dynamic photo;
  List<SubCategoryProduct>? products;

  SubCategories({this.id, this.name, this.photo, this.products});

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        products: json['products'] == null
            ? null
            : List<SubCategoryProduct>.from(
                json["products"].map((x) => SubCategoryProduct.fromJson(x))),
      );
}

class SubCategoryProduct {
  SubCategoryProduct({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.quantity,
    this.options,
    this.photos,
  });

  int? id;
  String? name;
  String? description;
  String? price;
  String? discount;
  String? quantity;
  List<SubProductOption>? options;
  List<SubproductPhotos>? photos;

  factory SubCategoryProduct.fromJson(Map<String, dynamic> json) =>
      SubCategoryProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        discount: json["discount"],
        quantity: json["quantity"],
        options: List<SubProductOption>.from(
            json["options"].map((x) => SubProductOption.fromJson(x))),
        photos:
            List<SubproductPhotos>.from(json["photos"].map((x) => SubproductPhotos.fromJson(x))),
      );
}

class SubProductOption {
  SubProductOption({
    this.id,
    this.productId,
    this.optionTypeId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productId;
  String? optionTypeId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SubProductOption.fromJson(Map<String, dynamic> json) =>
      SubProductOption(
        id: json["id"],
        productId: json["product_id"],
        optionTypeId: json["option_type_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class SubproductPhotos {
  SubproductPhotos({
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

  factory SubproductPhotos.fromJson(Map<String, dynamic> json) =>
      SubproductPhotos(
        id: json["id"] ?? null,
        productId: json["product_id"] ?? null,
        url: json["url"] ?? null,
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
