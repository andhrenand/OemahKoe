import 'package:get/get.dart';

import '../controllers/search_list_controller.dart';

class SearchListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchListController>(
      () => SearchListController(),
    );
  }
}
