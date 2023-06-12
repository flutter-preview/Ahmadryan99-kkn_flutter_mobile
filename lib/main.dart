// ignore_for_file: unused_import

import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/auth/login_screen.dart';
import 'package:boilerplate_ui/views/home_screen.dart';
import 'package:boilerplate_ui/views/logbook_screen.dart';
import 'package:boilerplate_ui/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'app_theme_notifier.dart';
import 'package:firebase_core/firebase_core.dart';

import 'views/setting_screen.dart';
import 'views/upload_screen.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return GetMaterialApp(
            onInit: () {
              MySize().init(context);
            },
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SplashScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    return LoginScreen();
  }
}
