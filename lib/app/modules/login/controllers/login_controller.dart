import 'package:boilerplate_ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Text-Field Controller
  final TextEditingController emailTFController = TextEditingController();
  final TextEditingController passwordTFController = TextEditingController();

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Other Variables
  final isInProgress = false.obs;
  final showPassword = false.obs;

  //UI Variables
  late OutlineInputBorder allTFBorder;

  get getOutlineInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: CustomAppTheme().bgLayer4, width: 1.5));

  void handleLogin() async {
    await Future.delayed(Duration(seconds: 1), () {
      isInProgress.value = false;

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => AppScreen(),
      //   ),
      // );
    });
    // }
  }
}
