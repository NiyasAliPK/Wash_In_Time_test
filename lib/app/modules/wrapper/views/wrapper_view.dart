import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wash_in_time/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:wash_in_time/app/modules/login/controllers/login_controller.dart';
import 'package:wash_in_time/app/modules/login/views/login_view.dart';

import '../controllers/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return _loginController.isLoggedIn == true
          ? BottomBarView()
          : LoginView();
    });
  }
}
