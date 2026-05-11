import 'package:get/get.dart';

class ListPropertyController extends GetxController {
  var selectedCategory = 'All'.obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  @override
  void onInit() {
    super.onInit();

    // ambil dari halaman sebelumnya
    if (Get.arguments != null) {
      selectedCategory.value = Get.arguments;
    }
  }
}