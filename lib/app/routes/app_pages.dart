import 'package:get/get.dart';

import '../modules/detail_property/bindings/detail_property_binding.dart';
import '../modules/detail_property/views/detail_property_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PROPERTY,
      page: () => const DetailPropertyView(),
      binding: DetailPropertyBinding(),
    ),
  ];
}
