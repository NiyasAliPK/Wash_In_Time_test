import 'package:get/get.dart';

import '../controllers/drinks_controller.dart';

class DrinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrinksController>(
      () => DrinksController(),
    );
  }
}
