import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_in_time/app/data/api/service.dart';

import 'package:wash_in_time/app/data/models/medicine_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getdataFromApi();
    super.onInit();
  }

  DateTime time = DateTime.now();
  final currentUser = FirebaseAuth.instance.currentUser;
  final Services _services = Get.put(Services());
  MedicineModel? data;

  greetings() {
    if (time.hour >= 00 && time.hour < 12) {
      update();
      return Text("Good Morning ${currentUser!.email}",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold));
    } else if (time.hour >= 12 && time.hour < 16) {
      update();
      return Text("Good Afternoon ${currentUser!.email}",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold));
    } else {
      update();
      return Text("Good Evening ${currentUser!.email}",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold));
    }
  }

  Future<dynamic> getdataFromApi() async {
    data = await _services.fetchAllData();
    update();
    return data ?? '';
  }
}
