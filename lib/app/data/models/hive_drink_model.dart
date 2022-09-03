import 'package:hive_flutter/adapters.dart';
part 'hive_drink_model.g.dart';

@HiveType(typeId: 1)
class HiveDrinkModel {
  @HiveField(0)
  final String drinkName;
  @HiveField(1)
  final String drinkCat;
  @HiveField(2)
  final String drinkID;

  HiveDrinkModel(
      {required this.drinkName, required this.drinkCat, required this.drinkID});
}
