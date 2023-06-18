import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
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
                    title: Text(
                      'Upload',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  key: _scaffoldKey,
                  backgroundColor: customAppTheme.bgLayer1,
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        baseCard(
                          title: "Artikel",
                          icon: IconlyBold.document,
                        ),
                        baseCard(
                          title: "Video",
                          icon: IconlyBold.video,
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: themeData.colorScheme.background,
                                hintText: "Masukkan Link Video",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: button),
            ));
      },
    );
  }

  Widget get button => InkWell(
        onTap: () {},
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeData.colorScheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Simpan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );

  Widget baseCard({
    required String title,
    required IconData icon,
    double? height,
    Widget? child,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeData.colorScheme.primary,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: Radius.circular(12),
              child: Container(
                height: height ?? 200,
                alignment: Alignment.center,
                width: double.infinity,
                color: Color.fromARGB(255, 147, 211, 144),
                child: child ??
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 7),
                            child: Text(
                              'Pilih File',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(
                            IconlyBold.arrow_down_2,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
