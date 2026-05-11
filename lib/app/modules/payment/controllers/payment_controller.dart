import 'package:get/get.dart';

class PaymentController extends GetxController {
  
  var selectedPayment = (-1).obs;
  
  void selectPayment (int index){
    selectedPayment.value =index;
  }
}
