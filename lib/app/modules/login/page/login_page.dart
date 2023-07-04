import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../views/app_screen.dart';
import '../controllers/login_controller.dart';
import '../database/database_helper.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: 'Error',
      content: Text(message),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('OK'),
      ),
    );
  }

  void _handleLogin() async {
    String email = _loginController.emailTFController.text.trim();
    String password = _loginController.passwordTFController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Email dan password harus diisi');
      return;
    }

    await _databaseHelper.initDatabase(); // Inisialisasi database

    User? user =
        await _databaseHelper.getUserByEmailAndPassword(email, password);

    if (user != null) {
      _loginController.isInProgress.value = true;
      await Future.delayed(Duration(seconds: 3));
      Get.offAll(() => AppScreen());
    } else {
      _showErrorDialog('Email atau password salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController.emailTFController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(MdiIcons.emailOutline),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _loginController.passwordTFController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(MdiIcons.lockOutline),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
