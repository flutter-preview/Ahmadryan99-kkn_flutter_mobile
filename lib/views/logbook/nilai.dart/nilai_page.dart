import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _loadHomeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadHomeData() async {
    if (mounted) {
      setState(() {
        isInProgress = true;
      });
    }

    await Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Nilai',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                key: _scaffoldKey,
                backgroundColor: customAppTheme.bgLayer1,
                body: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
