import 'package:get/get.dart';

import '../controllers/living_page_controller.dart';

class LivingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LivingPageController>(
      () => LivingPageController(),
    );
  }
}
