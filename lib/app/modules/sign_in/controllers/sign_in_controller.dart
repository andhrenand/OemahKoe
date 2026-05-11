import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oemah_koe/app/routes/app_pages.dart';
class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {
    final email = emailController.text;
    final password = passwordController.text;

  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    Get.toNamed(Routes.BOTTOM_NAVBAR);
    super.onClose();
  }
}