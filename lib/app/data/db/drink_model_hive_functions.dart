import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wash_in_time/app/data/models/hive_drink_model.dart';

class DrinkHiveModelController extends GetxController {
  @override
  void onInit() {
    getAllDrinksFromHive();
    super.onInit();
  }

  List<HiveDrinkModel> drinks = [];

  getAllDrinksFromHive() async {
    drinks.clear();
    final hiveDb = await Hive.openBox<HiveDrinkModel>('drink_db');
    drinks.addAll(hiveDb.values);
    update();
  }

  addDrinksToHive(HiveDrinkModel value) async {
    final hiveDb = await Hive.openBox<HiveDrinkModel>('drink_db');
    await hiveDb.add(value);
    await getAllDrinksFromHive();
    update();
  }
}
