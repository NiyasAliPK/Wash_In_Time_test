import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wash_in_time/app/data/models/hive_drink_model.dart';
import 'package:wash_in_time/app/data/models/hive_user_model.dart';
import 'package:wash_in_time/app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HiveUserModelAdapter().typeId)) {
    Hive.registerAdapter(HiveUserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(HiveDrinkModelAdapter().typeId)) {
    Hive.registerAdapter(HiveDrinkModelAdapter());
  }
  final LoginController loginController = Get.put(LoginController());
  await Firebase.initializeApp();
  await GetStorage.init('LoginStatus');
  await loginController.readDataFromGetxStorage();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
