import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';

part 'basket_hive_model.g.dart';

@HiveType(typeId: 0)
class BasketHiveModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int count;
  @HiveField(3)
  String imageUrl;
  @HiveField(4)
  String size;
  @HiveField(5)
  String color;
  @HiveField(6)
  String price;
  @HiveField(7)
  Uint8List? imageFile;

  BasketHiveModel(this.id, this.name, this.count, this.imageUrl, this.size,
      this.color, this.price,
      {this.imageFile});
}
