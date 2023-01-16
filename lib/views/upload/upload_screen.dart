import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/loading_screens.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  //Other Variables
  bool isInProgress = false;
  int _current = 0;

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

  Future<void> _refresh() async {
    _loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
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
                    'Upload',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                key: _scaffoldKey,
                backgroundColor: customAppTheme.bgLayer1,
                body: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 21),
                      child: SizedBox(
                        width: 360,
                        height: 201,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff71D16A)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 30,
                      child: Row(
                        children: [
                          Icon(IconlyLight.document, color: Colors.white),
                          Text(
                            'Artikel',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 26,
                      top: 65,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.white,
                        radius: Radius.circular(12),
                        child: Container(
                          height: 135,
                          width: 335,
                          color: Color.fromARGB(255, 147, 211, 144),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 130,
                        top: 120,
                        child: Container(
                          height: 30,
                          width: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 7),
                                child: Text(
                                  'Pilih File',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                IconlyBold.arrow_down_2,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 257),
                      child: SizedBox(
                        width: 360,
                        height: 95,
                        child: Column(
                          children: [
                            Container(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff71D16A)),
                                    child: Row(
                                      children: [
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9
                                        )),
                                        Icon(IconlyBold.video,color: Colors.white,),
                                        Text('Video', style: TextStyle(fontSize: 12,
                                        color: Colors.white,),)
                                      ], 
                                    ),
                              ),
                            ),
                          ],
                        ),
                        
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
