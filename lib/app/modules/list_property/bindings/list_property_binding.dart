import 'package:get/get.dart';

import '../controllers/list_property_controller.dart';

class ListPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPropertyController>(
      () => ListPropertyController(),
    );
  }
}
