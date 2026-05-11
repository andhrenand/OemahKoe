import 'package:get/get.dart';
import 'package:oemah_koe/app/data/dummy_data.dart';

class BookmarkController extends GetxController {
  final RxList<Map<String, dynamic>> savedProperties = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _seedBookmarks();
  }

  bool isBookmarked(Map<String, dynamic> property) {
    return savedProperties.any(
      (item) => _propertyId(item) == _propertyId(property),
    );
  }

  void toggleBookmark(Map<String, dynamic> property) {
    final propertyId = _propertyId(property);
    final existingIndex = savedProperties.indexWhere(
      (item) => _propertyId(item) == propertyId,
    );

    if (existingIndex >= 0) {
      savedProperties.removeAt(existingIndex);
      _syncSavedFlag(propertyId, false);
    } else {
      savedProperties.insert(0, property);
      _syncSavedFlag(propertyId, true);
    }

    savedProperties.refresh();
  }

  void _seedBookmarks() {
    savedProperties.assignAll(
      dummyProperties.where(
        (property) =>
            (property['isSaved']?.toString().toLowerCase() ?? '') == 'true',
      ),
    );
  }

  void _syncSavedFlag(String propertyId, bool isSaved) {
    for (final property in dummyProperties) {
      if (_propertyId(property) == propertyId) {
        property['isSaved'] = isSaved.toString();
      }
    }
  }

  String _propertyId(Map<String, dynamic> property) {
    return '${property['title']}-${property['location']}-${property['image']}';
  }
}
