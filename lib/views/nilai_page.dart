import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/select_theme_dialog.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../app_theme_notifier.dart';
import 'about_app_dialog.dart';

class NilaiScreen extends StatefulWidget {
  @override
  _NilaiScreenState createState() => _NilaiScreenState();
}

class _NilaiScreenState extends State<NilaiScreen> {
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
                backgroundColor: customAppTheme.bgLayer1,
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Nilai'),
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
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: 60,
                width: MySize.safeWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: themeData.colorScheme.primary,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Text(
                          'Log Book',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text(
                'Kegiatan',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              '95',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
