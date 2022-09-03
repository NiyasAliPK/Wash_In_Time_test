// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_drink_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDrinkModelAdapter extends TypeAdapter<HiveDrinkModel> {
  @override
  final int typeId = 1;

  @override
  HiveDrinkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDrinkModel(
      drinkName: fields[0] as String,
      drinkCat: fields[1] as String,
      drinkID: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDrinkModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.drinkName)
      ..writeByte(1)
      ..write(obj.drinkCat)
      ..writeByte(2)
      ..write(obj.drinkID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDrinkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
