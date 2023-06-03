import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../app_theme_notifier.dart';

class AboutAppDialog extends StatefulWidget {
  @override
  _AboutAppDialogState createState() => _AboutAppDialogState();
}

class _AboutAppDialogState extends State<AboutAppDialog> {
  late ThemeData themeData;

  String appDescription = "aplikasi ini masih coba coba";

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
              elevation: 0,
              child: SizedBox.expand(
                  child: Stack(
                children: [
                  Positioned(
                      right: 5,
                      top: 5,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            MdiIcons.close,
                            color: themeData.colorScheme.primary,
                          ))),
                  Positioned.fill(
                    top: 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Aplikasi Apa Ini : ",
                              style: AppTheme.getTextStyle(
                                themeData.textTheme.titleLarge!,
                              )),
                          SizedBox(height: MySize.size10),
                          Text(
                            "Aplikasi Kuntul",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.titleLarge!,
                                color: themeData.colorScheme.primary,
                                fontWeight: 700),
                          ),
                          Container(
                            margin: Spacing.only(top: 20, bottom: 20),
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.onPrimary,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  //Set your logo App Here
                                  image: AssetImage(
                                    "./assets/images/logo.png",
                                  ),
                                )),
                            height: MySize.size180,
                            width: MySize.size180,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              padding: Spacing.all(20),
                              child: Text(appDescription,
                                  textAlign: TextAlign.justify,
                                  style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodySmall!,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )));
        });
        // return Dialog(
        //     child: Container(
        //       padding: Spacing.fromLTRB(20, 30, 20, 30),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: <Widget>[
        //           Text("Welcome",
        //               style: AppTheme.getTextStyle(
        //                 themeData.textTheme.headline6,
        //               )),
        //           Text(
        //             "Dimas Ibnu Malik",
        //             style: AppTheme.getTextStyle(themeData.textTheme.headline6,
        //                 color: themeData.colorScheme.primary, fontWeight: 700),
        //           ),
        //         ],
        //       ),
        //   ),
        // );
      },
    );
  }
}
