import 'package:get/get.dart';
import 'package:oemah_koe/app/data/dummy_data.dart';

class HomeController extends GetxController {
  final allData = dummyProperties;

  List<Map<String, dynamic>> get filteredData => allData
      .where((item) => item['location'] == dummyUser["location"])
      .toList();
}
