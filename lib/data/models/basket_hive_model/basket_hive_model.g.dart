// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketHiveModelAdapter extends TypeAdapter<BasketHiveModel> {
  @override
  final int typeId = 0;

  @override
  BasketHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketHiveModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      imageFile: fields[7] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, BasketHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.imageFile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
