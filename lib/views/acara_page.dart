import 'package:boilerplate_ui/views/detail_acara_page.dart';
import 'package:boilerplate_ui/views/info_daftar_kelompok.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_theme.dart';
import '../utils/SizeConfig.dart';

class ImageInfo {
  final String imagePath;
  final String title;
  final String description;

  ImageInfo({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class InfoAcara extends StatelessWidget {
  final List<ImageInfo> imageList = [
    ImageInfo(
      imagePath: 'assets/images/wayang.png',
      title: 'Kelompok 1',
      description:
          'Wayang adalah seni pertunjukan yang berkembang di Indonesia.',
    ),
    ImageInfo(
      imagePath: 'assets/images/dangdut.png',
      title: 'kelompok 2',
      description: 'Dangdut adalah genre musik yang berasal dari Indonesia.',
    ),
    ImageInfo(
      imagePath: 'assets/images/jalan.png',
      title: 'kelompok 3',
      description:
          'Jalan adalah suatu prasarana yang digunakan untuk berlalu lintas.',
    ),
    ImageInfo(
      imagePath: 'assets/images/pasar.png',
      title: 'kelompok 4',
      description: 'Pasar adalah tempat bertemunya penjual dan pembeli.',
    ),
    ImageInfo(
      imagePath: 'assets/images/wayang.png',
      title: 'kelompok 5',
      description:
          'Wayang adalah seni pertunjukan yang berkembang di Indonesia.',
    ),
  ];

  // Tambahkan lebih banyak gambar di sini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Daftar Acara'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Spacing.all(25),
          child: Column(
            children: [_newsListWidget()],
          ),
        ),
      ),
    );
  }

  Widget _newsListWidget() {
    return Column(
      children: List.generate(
        imageList.length,
        (index) => _singleNews(index),
      ),
    );
  }

  Widget _singleNews(int index) {
    final imageInfo = imageList[index];
    return InkWell(
      onTap: () {
        Get.to(DetailAcaraPage());
      },
      child: Column(
        children: [
          Container(
            height: MySize.getScaledSizeHeight(150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageInfo.imagePath),
              ),
            ),
            margin: Spacing.symmetric(vertical: 10),
          ),
          Container(
            padding: Spacing.symmetric(horizontal: 10),
            child: Text(
              imageInfo.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              maxLines: 2,
            ),
          ),
          Container(
            padding: Spacing.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(
              imageInfo.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
