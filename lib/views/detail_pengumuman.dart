import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DetailPengumuman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PENGUMUMAN'),
        // backgroundColor: ,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pembukaan KKN Tahun Ajaran 2020/2021',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    IconlyLight.calendar,
                    size: 16,
                    color: Colors.black,
                  ),
                  SizedBox(width: 11),
                  Text(
                    'Tanggal: 10 Juni 2023',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Pembukaan program Kuliah Kerja Nyata (KKN) diadakan Mahasiswa Universitas Nahdlatul Ulama pada hari Minggu, 01 Januari 2023 berlokasi di Graha NU Klampok Kab. Blitar.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailPengumuman(),
    );
  }
}
