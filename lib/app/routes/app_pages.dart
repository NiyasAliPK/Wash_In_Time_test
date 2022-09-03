import 'package:get/get.dart';

import 'package:wash_in_time/app/modules/bottom_bar/bindings/bottom_bar_binding.dart';
import 'package:wash_in_time/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:wash_in_time/app/modules/drinks/bindings/drinks_binding.dart';
import 'package:wash_in_time/app/modules/drinks/views/drinks_view.dart';
import 'package:wash_in_time/app/modules/home/bindings/home_binding.dart';
import 'package:wash_in_time/app/modules/home/views/home_view.dart';
import 'package:wash_in_time/app/modules/login/bindings/login_binding.dart';
import 'package:wash_in_time/app/modules/login/views/login_view.dart';
import 'package:wash_in_time/app/modules/wrapper/bindings/wrapper_binding.dart';
import 'package:wash_in_time/app/modules/wrapper/views/wrapper_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WRAPPER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WRAPPER,
      page: () => WrapperView(),
      binding: WrapperBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.DRINKS,
      page: () => DrinksView(),
      binding: DrinksBinding(),
    ),
  ];
}
