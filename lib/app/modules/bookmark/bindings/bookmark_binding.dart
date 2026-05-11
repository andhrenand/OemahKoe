import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<BookmarkController>()) {
      Get.put(BookmarkController(), permanent: true);
    }
  }
}
