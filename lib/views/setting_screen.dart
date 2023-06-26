import 'package:boilerplate_ui/app/modules/login/page/login_page.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/detail_pusat_bantuan.dart';
import 'package:boilerplate_ui/views/kebijakan_privasi.dart';
import 'package:boilerplate_ui/views/select_theme_dialog.dart';
import 'package:boilerplate_ui/views/ubah_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../app_theme_notifier.dart';
import 'about_app_dialog.dart';
import 'nilai_page.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  //ThemeData
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Other Variables
  bool isInProgress = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: Scaffold(
                key: _scaffoldKey,
                backgroundColor: customAppTheme.bgLayer1,
                appBar: AppBar(
                  backgroundColor: themeData.colorScheme.primary,
                  elevation: 0,
                  centerTitle: true,
                  title: Text("Setting",
                      style: AppTheme.getTextStyle(
                          themeData.appBarTheme.titleTextStyle!,
                          fontWeight: 600,
                          color: themeData.colorScheme.onPrimary)),
                ),
                body: Column(
                  children: [
                    Container(
                      height: MySize.size3,
                      child: isInProgress
                          ? LinearProgressIndicator(
                              minHeight: MySize.size3,
                            )
                          : Container(
                              height: MySize.size3,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                )));
      },
    );
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: Spacing.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: Icon(
                  MdiIcons.accountCircle,
                  color: themeData.colorScheme.primary,
                  size: 60,
                ),
              ),
              SizedBox(width: MySize.size18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama Mahasiswa",
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.titleLarge!,
                      )),
                  Text("Kelompok 4",
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyLarge!,
                        fontWeight: 500,
                        color: themeData.colorScheme.primary,
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: MySize.size16),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: MySize.safeWidth,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xff42C83C),
                )),
              ),
            ),
            Row(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Text(
                  'Nilai',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => NilaiScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 190),
                    child: Text(
                      '92,5',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ])
          ],
        ),
        _menuItem(
            title: "Pengaturan Profil",
            icon: IconlyBold.profile,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ChangePasswordPage());
            }),
        _menuItem(title: "Tema", icon: Icons.star_rate_rounded, onTap: () {}),
        _menuItem(
            title: "Pusat Bantuan",
            icon: Icons.call_rounded,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => PusatBantuan());
            }),
        _menuItem(
            title: "Kebijakan Privasi",
            icon: Icons.shield_outlined,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => KebijakanPrivasi());
            }),
        _menuItem(
            title: "Keluar",
            icon: Icons.logout,
            onTap: () {
              Get.to(LoginPage());
            }),
      ],
    );
  }

  _menuItem(
      {required String title,
      required IconData icon,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: Spacing.fromLTRB(30, 20, 20, 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: themeData.colorScheme.secondary,
              size: MySize.size28,
            ),
            SizedBox(width: MySize.size24),
            Text(
              title,
              style: AppTheme.getTextStyle(
                themeData.textTheme.titleMedium!,
                fontWeight: 600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
