import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/home_screen.dart';
import 'package:boilerplate_ui/views/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'upload_screen.dart';
import 'logbook_screen.dart';

class AppScreen extends StatefulWidget {
  final int selectedPage;

  const AppScreen({Key? key, this.selectedPage = 0}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeMode = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeMode);
        customAppTheme = AppTheme.getCustomAppTheme(themeMode);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
            backgroundColor: themeData.colorScheme.primary,
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              shape: CircularNotchedRectangle(),
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  boxShadow: [
                    BoxShadow(
                      color: themeData.cardTheme.shadowColor!.withAlpha(40),
                      blurRadius: 3,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                padding: Spacing.only(top: 12, bottom: 12),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: themeData.colorScheme.primary,
                  tabs: <Widget>[
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MdiIcons.home,
                            color: Colors.white,
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Beranda",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Visibility(
                            visible: _currentIndex == 0 ? true : false,
                            child: Container(
                              margin: Spacing.top(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.5)),
                              ),
                              height: 5,
                              width: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            MdiIcons.fileDocumentOutline,
                            color: Colors.white,
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Logbook",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Visibility(
                              visible: _currentIndex == 1 ? true : false,
                              child: Container(
                                margin: Spacing.top(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.5)),
                                ),
                                height: 5,
                                width: 10,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            MdiIcons.fileUploadOutline,
                            color: Colors.white,
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Upload",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Visibility(
                              visible: _currentIndex == 2 ? true : false,
                              child: Container(
                                margin: Spacing.top(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.5)),
                                ),
                                height: 5,
                                width: 10,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            MdiIcons.accountCircleOutline,
                            color: Colors.white,
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Profil",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Visibility(
                              visible: _currentIndex == 3 ? true : false,
                              child: Container(
                                margin: Spacing.top(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.5)),
                                ),
                                height: 5,
                                width: 10,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                HomeScreen(),
                LogbookScreen(),
                UploadScreen(),
                SettingScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
