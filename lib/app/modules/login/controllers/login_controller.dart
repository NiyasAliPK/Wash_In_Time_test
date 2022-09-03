import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GetStorage _getStorage = GetStorage();
  bool isLoggedIn = false;

  logIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Please enter your login credentials ", '');
      return;
    }
    Get.defaultDialog(
        content: CircularProgressIndicator(), title: 'Please wait...');
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await storeDataToGetStorage(true);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Get.snackbar(e.message.toString(), '');
      return;
    }
    Get.back();
    emailController.clear();
    passwordController.clear();
  }

  storeDataToGetStorage(bool value) async {
    await _getStorage.write('LoginStatus', value);
    await readDataFromGetxStorage();
    update();
  }

  readDataFromGetxStorage() async {
    if (_getStorage.read('LoginStatus') != null) {
      isLoggedIn = await _getStorage.read('LoginStatus');
      update();
    }
  }
}
