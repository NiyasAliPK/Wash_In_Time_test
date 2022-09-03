import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wash_in_time/app/data/models/hive_user_model.dart';

class UserHiveController extends GetxController {
  @override
  void onInit() {
    getAllDataFromHive();
    super.onInit();
  }

  List<HiveUserModel> user = [];

  getAllDataFromHive() async {
    user.clear();
    final hiveDb = await Hive.openBox<HiveUserModel>('user_db');
    user.addAll(hiveDb.values);
    update();
  }

  addUserToHive(HiveUserModel value) async {
    final hiveDb = await Hive.openBox<HiveUserModel>('user_db');
    hiveDb.put(0, value);
    await getAllDataFromHive();
    update();
  }
}
