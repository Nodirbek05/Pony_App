// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromJson(jsonString);

import 'dart:convert';

MyOrderModel myOrderModelFromJson(String str) =>
    MyOrderModel.fromJson(json.decode(str));

class MyOrderModel {
  MyOrderModel({
    this.data,
  });

  Data? data;

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.orders,
  });

  List<Order>? orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );
}

class Order {
  Order({
    this.id,
    this.userId,
    this.status,
    this.cashType,
    this.sum,
    this.items,
  });

  int? id;
  String? userId;
  String? status;
  String? cashType;
  String? sum;
  List<Item>? items;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        status: json["status"],
        cashType: json["cash_type"],
        sum: json["sum"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}

class Item {
  Item({
    this.quantity,
    this.product,
  });

  String? quantity;
  OrderProduct? product;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        quantity: json["quantity"],
        product: OrderProduct.fromJson(json["product"]),
      );
}

class OrderProduct {
  OrderProduct({
    this.id,
    this.name,
    this.description,
    this.descriptionUz,
    this.price,
    this.discount,
    this.quantity,
    this.photos,
    this.options,
  });

  int? id;
  String? name;
  String? description;
  String? descriptionUz;
  String? price;
  String? discount;
  String? quantity;
  List<Option>? photos;
  List<Option>? options;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        descriptionUz: json["description_uz"],
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
