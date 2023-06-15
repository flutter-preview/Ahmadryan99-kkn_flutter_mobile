import 'package:boilerplate_ui/views/info_daftar_kelompok.dart';
import 'package:flutter/material.dart';

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

class InfoKelompok extends StatelessWidget {
  final List<ImageInfo> imageList = [
    ImageInfo(
      imagePath: 'assets/images/kelompok1.png',
      title: 'Gambar 1',
      description: 'Informasi tentang Gambar 1',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok2.png',
      title: 'Gambar 2',
      description: 'Informasi tentang Gambar 2',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok3.png',
      title: 'Gambar 3',
      description: 'Informasi tentang Gambar 3',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok1.png',
      title: 'Gambar 1',
      description: 'Informasi tentang Gambar 1',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok2.png',
      title: 'Gambar 2',
      description: 'Informasi tentang Gambar 2',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok3.png',
      title: 'Gambar 3',
      description: 'Informasi tentang Gambar 3',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok1.png',
      title: 'Gambar 1',
      description: 'Informasi tentang Gambar 1',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok2.png',
      title: 'Gambar 2',
      description: 'Informasi tentang Gambar 2',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok3.png',
      title: 'Gambar 3',
      description: 'Informasi tentang Gambar 3',
    ),
    ImageInfo(
      imagePath: 'assets/images/kelompok1.png',
      title: 'Gambar 1',
      description: 'Informasi tentang Gambar 1',
    ),

    // Tambahkan lebih banyak gambar di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Daftar Kelompok'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Ubah jumlah gambar per baris di sini
            mainAxisSpacing: 30,
            crossAxisSpacing: 36,
            childAspectRatio: 1, // Sesuaikan rasio sesuai kebutuhan
          ),
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            final imageInfo = imageList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InformasiKelompokPage(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: AssetImage(imageInfo.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'Kelompok ${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
