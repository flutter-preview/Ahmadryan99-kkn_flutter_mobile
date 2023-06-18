import 'package:flutter/material.dart';

class DetailAcaraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Acara'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'path_to_image'), // Ganti dengan path gambar yang sesuai
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            SizedBox(height: 10),
            Text(
              'Nama Pasar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Kelompok',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Jam: 09:00 - 16:00',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Tanggal: 10 Juni 2023',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi Acara',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
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
      home: DetailAcaraPage(),
    );
  }
}
