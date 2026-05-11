import 'package:get/get.dart';

class LivingPageController extends GetxController {}

class CartController extends GetxController {
  final RxList<Map<String, dynamic>> cartItems =
      <Map<String, dynamic>>[].obs; //Create empty list to put item on it

  // Function to add item into cart
  void addToCart(Map<String, dynamic> product) {
    final index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      cartItems[index]['quantityCart']++;
      cartItems.refresh();
    } else {
      cartItems.add({...product, 'quantityCart': 1});
    }
  }

  // Function to calculate the total item in the cart
  int get totalItem {
    return cartItems.fold(
      0,
      (total, item) => total + (item['quantityCart'] as int),
    );
  }

  // Function to calculate the total price
  int get totalPrice {
    return cartItems.fold(
      0,
      (total, item) =>
          total + ((item['price'] as int) * (item['quantityCart'] as int)),
    );
  }
}
