import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wash_in_time/app/data/db/drink_model_hive_functions.dart';
import 'package:wash_in_time/app/data/db/user_model_hive_functions.dart';
import 'package:wash_in_time/app/data/models/drinks_model.dart';
import 'package:wash_in_time/app/data/models/hive_drink_model.dart';
import 'package:wash_in_time/app/data/models/hive_user_model.dart';
import 'package:wash_in_time/app/data/models/medicine_model.dart';
import 'package:wash_in_time/app/data/models/user_model.dart';

class Services extends GetxController {
  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  final DrinkHiveModelController _drinkHiveModelController =
      Get.put(DrinkHiveModelController());
  final UserHiveController _userHiveController = Get.put(UserHiveController());
  DrinksModel? drinksModel;
  List<UserModel> userModel = [];

  fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://run.mocky.io/v3/fc713ee3-4135-45fb-8e5c-330932244311'));
      if (response.statusCode == 200) {
        final medicineModel = medicineModelFromMap(response.body);

        return medicineModel;
      }
    } catch (e) {
      Get.snackbar(
          'Oops', "Somthing went wrong please try again later. error code $e");
    }
  }

  getAllDrinksAndUser() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=marGarita'));

      if (response.statusCode == 200) {
        drinksModel = drinksModelFromJson(response.body);
        _drinkHiveModelController.drinks.clear();
        for (var element in drinksModel!.drinks) {
          final data = HiveDrinkModel(
              drinkName: element.strDrink.toString(),
              drinkCat: element.strCategory.toString(),
              drinkID: element.idDrink!);
          await _drinkHiveModelController.addDrinksToHive(data);
        }
        update();
      }

      final response2 = await http.get(Uri.parse('https://randomuser.me/api/'));
      if (response2.statusCode == 200) {
        final json = jsonDecode(response2.body);
        Iterable list = json["results"];

        userModel.add(UserModel.fromMap(list.first));
        final data = HiveUserModel(
            name: userModel.first.name!.first!,
            gender: userModel.first.gender!,
            age: userModel.first.dob!.age.toString(),
            email: userModel.first.email.toString(),
            city: userModel.first.location!.city.toString(),
            phone: userModel.first.phone.toString(),
            cell: userModel.first.cell.toString(),
            regDate: userModel.first.registered.toString(),
            nation: userModel.first.nat.toString());
        await _userHiveController.addUserToHive(data);
        print('aaa ${userModel.first.name!.first!}');
        update();
      }
    } catch (e) {
      Get.snackbar(
          'Oops', "Somthing went wrong please try again later. error code $e");
    }
    update();
  }

  getAll() async {
    await fetchAllData();
    await getAllDrinksAndUser();
    update();
  }
}
