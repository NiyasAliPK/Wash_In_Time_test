import 'package:get/get.dart';

class DrinksController extends GetxController {
  int pageIndex = 0;

  changeIndex(int value) {
    pageIndex = value;
    update();
  }
}
