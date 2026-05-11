import 'package:get/get.dart';
import 'package:oemah_koe/app/modules/bookmark/bindings/bookmark_binding.dart';
import 'package:oemah_koe/app/modules/home/bindings/home_binding.dart';
import 'package:oemah_koe/app/modules/living_page/bindings/living_page_binding.dart';
import 'package:oemah_koe/app/modules/profile/bindings/profile_binding.dart';
import 'package:oemah_koe/app/modules/search_list/bindings/search_list_binding.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(
      () => BottomNavbarController(),
    );
    HomeBinding().dependencies();
    SearchListBinding().dependencies();
    LivingPageBinding().dependencies();
    BookmarkBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
