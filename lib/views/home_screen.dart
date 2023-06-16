import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/loading_screens.dart';
import 'package:boilerplate_ui/views/nilai_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'acara_page.dart';
import 'daftar_kelompok.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ThemeData
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  //Other Variables
  bool isInProgress = false;
  int _current = 0;

  List imgCategoryList = [
    'assets/images/kelompok3.png',
    'assets/images/kelompok2.png',
    'assets/images/kelompok1.png',
  ];

  List nameCategoryList = [
    'Kelompok 1',
    'Kelompok 2 ',
    'Kelompok 3',
  ];

  List imgNews = [
    'assets/images/pasar.png',
    'assets/images/wayang.png',
    'assets/images/dangdut.png',
    'assets/images/jalan.png',
  ];

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
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: customAppTheme.bgLayer1,
                  body: RefreshIndicator(
                    onRefresh: _refresh,
                    backgroundColor: customAppTheme.bgLayer1,
                    color: themeData.colorScheme.primary,
                    key: _refreshIndicatorKey,
                    child: Column(
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
                        )
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  _buildBody() {
    if (isInProgress) {
      return LoadingScreens.getHomeLoading(context, themeData, customAppTheme);
    } else if (!isInProgress) {
      return Container(
          padding: Spacing.only(left: 20, top: 20, right: 20),
          child: ListView(
            children: [
              _userProfile(),
              _sliderBanner(),
              _totalNilai(),
              _categoriesWidget(),
              _newsWidget(),
            ],
          ));
    }
  }

  _userProfile() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome",
              style: AppTheme.getTextStyle(
                themeData.textTheme.titleLarge!,
              )),
          Text(
            "Nama Mahasiswa",
            style: AppTheme.getTextStyle(themeData.textTheme.titleLarge!,
                color: themeData.colorScheme.primary, fontWeight: 700),
          ),
        ],
      ),
      InkWell(
        onTap: () {},
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary.withAlpha(20),
                border: Border.all(width: 1),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "./assets/images/no-image.png",
                  ),
                )),
            height: MySize.size54,
            width: MySize.size54,
          ),
        ),
      )
    ]);
  }

  _sliderBanner() {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: Spacing.only(top: 10),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          height: 149,
                          width: MySize.safeWidth,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(19),
                          child: Container(
                            child: const SizedBox(
                              width: 87,
                              child: Text(
                                'Percaya dengan kami?Berarti Anda Musyrik',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 70,
                        child: Container(
                          height: 135,
                          width: 325,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("./assets/images/banner1.png"),
                          )),
                        ),
                      )
                    ],
                  );
                },
              );
            }).toList()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4].map((i) {
            int index = [1, 2, 3, 4].indexOf(i);
            return Container(
              width: MySize.size8,
              height: MySize.size8,
              margin: Spacing.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? themeData.colorScheme.secondaryContainer
                    : Colors.grey[400],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  _totalNilai() {
    return Stack(
      children: [
        Container(
          height: 69,
          width: MySize.safeWidth,
          child: DecoratedBox(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeData.colorScheme.primary,
          )),
        ),
        Row(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 29),
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
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => NilaiScreen()));
                Get.to(NilaiScreen());
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
    );
  }

  _categoriesWidget() {
    List<Widget> list = [];
    list = List.generate(imgCategoryList.length, (_) => _singleCategory(_));

    // * Add Show All Categories Menu
    return Container(
      padding: Spacing.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Info Kelompok",
                  style: AppTheme.getTextStyle(themeData.textTheme.titleLarge!,
                      fontWeight: 700, color: themeData.colorScheme.secondary)),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => InfoKelompok()));
                  },
                  child: Text("Lihat semua",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodySmall!,
                          fontWeight: 700,
                          color: themeData.colorScheme.primary))),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: list,
            ),
          ),
        ],
      ),
    );
  }

  _singleCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
            width: 125,
            height: 155,
            decoration: BoxDecoration(
              color: themeData.colorScheme.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imgCategoryList[index],
                ),
              ),
            ),
            padding: Spacing.all(15),
          ),
          Container(
            width: MySize.size76,
            padding: Spacing.top(8),
            child: Text(
              nameCategoryList[index],
              textAlign: TextAlign.center,
              style: AppTheme.getTextStyle(themeData.textTheme.bodySmall!,
                  fontWeight: 600, letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }

  _newsWidget() {
    return Container(
      padding: Spacing.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Acara",
                  style: AppTheme.getTextStyle(themeData.textTheme.titleLarge!,
                      fontWeight: 700, color: themeData.colorScheme.secondary)),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => InfoAcara()));
                  },
                  child: Text("Lihat semua",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodySmall!,
                          fontWeight: 700,
                          color: themeData.colorScheme.primary))),
            ],
          ),
          _newsListWidget()
        ],
      ),
    );
  }

  _newsListWidget() {
    List<Widget> list = [];
    list = List.generate(imgNews.length, (_) => _singleNews(_));
    return Column(children: list);
  }

  _singleNews(int index) {
    return Column(children: [
      Container(
        height: MySize.getScaledSizeHeight(150),
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(imgNews[index]))),
        margin: Spacing.symmetric(vertical: 10),
      ),
      Container(
        child: Text(
          'Pasar Malam di Desa Rejowilangun Kelompok 5',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
        ),
      ),
    ]);
  }

  // showMessage({String message = "Something wrong", Duration duration}) {
  //   if (duration == null) {
  //     duration = Duration(seconds: 3);
  //   }
  //   _scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       duration: duration,
  //       content: Text(message,
  //           style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
  //               letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
  //       backgroundColor: themeData.colorScheme.primary,
  //       behavior: SnackBarBehavior.fixed,
  //     ),
  //   );
  // }
}
