import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../views/app_screen.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {

  Widget build(BuildContext context) {
    return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Container(
                    color: CustomAppTheme().bgLayer1,
                    child: ListView(
                      padding: Spacing.top(100),
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'KKN',
                            style: TextStyle(
                                color: Colors.green[400],
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'UNU BLITAR',
                            style: TextStyle(
                                color: Colors.green[400],
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 158),
                        Container(
                          margin: Spacing.fromLTRB(24, 24, 24, 0),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                Get.theme.textTheme.bodyLarge!,
                                letterSpacing: 0.1,
                                color: Get.theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                                hintText: "Nomer Induk Mahasiswa",
                                hintStyle: AppTheme.getTextStyle(
                                    Get.theme.textTheme.titleSmall!,
                                    letterSpacing: 0.1,
                                    color: Get.theme.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: controller.getOutlineInputBorder,
                                enabledBorder: controller.getOutlineInputBorder,
                                focusedBorder: controller.getOutlineInputBorder,
                                prefixIcon: Icon(
                                  MdiIcons.emailOutline,
                                  size: MySize.size22,
                                ),
                                isDense: true,
                                contentPadding: Spacing.zero),
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailTFController,
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: TextFormField(
                            obscureText: !(controller.showPassword.value),
                            style: AppTheme.getTextStyle(
                                Get.theme.textTheme.bodyLarge!,
                                letterSpacing: 0.1,
                                color: Get.theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  Get.theme.textTheme.titleSmall!,
                                  letterSpacing: 0.1,
                                  color: Get.theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: "Kata sandi",
                              border: controller.getOutlineInputBorder,
                              enabledBorder: controller.getOutlineInputBorder,
                              focusedBorder: controller.getOutlineInputBorder,
                              prefixIcon: Icon(
                                MdiIcons.lockOutline,
                                size: 22,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                    controller.showPassword.value = !(controller.showPassword.value);
                                },
                                child: Icon(
                                  (controller.showPassword.value)
                                      ? MdiIcons.eyeOffOutline
                                      : MdiIcons.eyeOutline,
                                  size: MySize.size22,
                                ),
                              ),
                              isDense: true,
                              contentPadding: Spacing.zero,
                            ),
                            controller: controller.passwordTFController,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        Container(
                            margin: Spacing.fromLTRB(24, 24, 24, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size48)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Get.theme.colorScheme.primary
                                        .withAlpha(100),
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                               
                                onPressed:
                                    controller.isInProgress.value ? () {} : () => controller.handleLogin(),
                                child: Stack(
                                  // overflow: Overflow.visible,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: controller.isInProgress.value
                                          ? Container(
                                              width: MySize.size20,
                                              height: MySize.size20,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        Get.theme.colorScheme
                                                            .onPrimary),
                                              ),
                                            )
                                          : Text(
                                              "MASUK".toUpperCase(),
                                              style: AppTheme.getTextStyle(
                                                  Get.theme
                                                      .textTheme.bodyMedium!,
                                                  color: Get.theme
                                                      .colorScheme.onPrimary,
                                                  letterSpacing: 0.8,
                                                  fontWeight: 700),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Center(
                          child: Container(
                            margin: Spacing.top(16),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text(
                                "Ada Kendala? Klick Disini",
                                style: AppTheme.getTextStyle(
                                    Get.theme.textTheme.bodyMedium!,
                                    color: Get.theme.colorScheme.onBackground,
                                    fontWeight: 500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                        // AuthController.notice(Get.theme)
                      ],
                    )),
    );
  }

  void showMessage({String message = "Something wrong", Duration? duration}) {
    if (duration == null) {
      duration = Duration(seconds: 3);
    }
    // _scaffoldKey.currentState.showSnackBar(
    //   SnackBar(
    //     duration: duration,
    //     content: Text(message,
    //         style: AppTheme.getTextStyle(Get.theme.textTheme.subtitle2,
    //             letterSpacing: 0.4, color: Get.theme.colorScheme.onPrimary)),
    //     backgroundColor: Get.theme.colorScheme.primary,
    //     behavior: SnackBarBehavior.fixed,
    //   ),
    // );
  }
}
