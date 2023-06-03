import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../app_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Theme Data
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  //Text-Field Controller
  late TextEditingController emailTFController;
  late TextEditingController passwordTFController;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Other Variables
  bool isInProgress = false;
  bool showPassword = false;

  //UI Variables
  late OutlineInputBorder allTFBorder;

  @override
  void initState() {
    super.initState();
    isInProgress = false;
    emailTFController = TextEditingController(text: "");
    passwordTFController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    emailTFController.dispose();
    passwordTFController.dispose();
    super.dispose();
  }

  _initUI() {
    allTFBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: customAppTheme.bgLayer4, width: 1.5));
  }

  _handleLogin() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => AppScreen(),
        ),
      );
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        _initUI();
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                body: Container(
                    color: customAppTheme.bgLayer1,
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
                                themeData.textTheme.bodyLarge!,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                                hintText: "Nomer Induk Mahasiswa",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.titleSmall!,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: allTFBorder,
                                enabledBorder: allTFBorder,
                                focusedBorder: allTFBorder,
                                prefixIcon: Icon(
                                  MdiIcons.emailOutline,
                                  size: MySize.size22,
                                ),
                                isDense: true,
                                contentPadding: Spacing.zero),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailTFController,
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: TextFormField(
                            obscureText: !showPassword,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyLarge!,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.titleSmall!,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: "Kata sandi",
                              border: allTFBorder,
                              enabledBorder: allTFBorder,
                              focusedBorder: allTFBorder,
                              prefixIcon: Icon(
                                MdiIcons.lockOutline,
                                size: 22,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Icon(
                                  showPassword
                                      ? MdiIcons.eyeOffOutline
                                      : MdiIcons.eyeOutline,
                                  size: MySize.size22,
                                ),
                              ),
                              isDense: true,
                              contentPadding: Spacing.zero,
                            ),
                            controller: passwordTFController,
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
                                    color: themeData.colorScheme.primary
                                        .withAlpha(100),
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                // shape: RoundedRectangleBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(MySize.size8)),
                                // color: themeData.colorScheme.primary,
                                // highlightColor: themeData.colorScheme.primary,
                                // splashColor: Colors.white.withAlpha(100),
                                // padding: Spacing.only(top: 16, bottom: 16),
                                onPressed:
                                    isInProgress ? () {} : () => _handleLogin(),
                                child: Stack(
                                  // overflow: Overflow.visible,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: isInProgress
                                          ? Container(
                                              width: MySize.size20,
                                              height: MySize.size20,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        themeData.colorScheme
                                                            .onPrimary),
                                              ),
                                            )
                                          : Text(
                                              "MASUK".toUpperCase(),
                                              style: AppTheme.getTextStyle(
                                                  themeData
                                                      .textTheme.bodyMedium!,
                                                  color: themeData
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
                                    themeData.textTheme.bodyMedium!,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                        // AuthController.notice(themeData)
                      ],
                    ))));
      },
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
    //         style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
    //             letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
    //     backgroundColor: themeData.colorScheme.primary,
    //     behavior: SnackBarBehavior.fixed,
    //   ),
    // );
  }
}
