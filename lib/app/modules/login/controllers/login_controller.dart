// File: login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../views/app_screen.dart';

class LoginController extends GetxController {
  final TextEditingController emailTFController = TextEditingController();
  final TextEditingController passwordTFController = TextEditingController();

  final isInProgress = false.obs;
  final showPassword = false.obs;

  void handleLogin() async {
    String email = emailTFController.text.trim();
    String password = passwordTFController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isInProgress.value = true;
    await Future.delayed(Duration(seconds: 3));

    Get.offAll(AppScreen());
  }

  @override
  void dispose() {
    emailTFController.dispose();
    passwordTFController.dispose();
    super.dispose();
  }
}
