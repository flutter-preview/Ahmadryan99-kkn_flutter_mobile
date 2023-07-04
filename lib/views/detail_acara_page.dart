import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DetailAcaraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Acara'),
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
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/pasar.png'), // Ganti dengan path gambar yang sesuai
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
              Row(
                children: [
                  Icon(
                    IconlyLight.user_1,
                    size: 16,
                    color: Colors.black,
                  ),
                  SizedBox(width: 11),
                  Text(
                    'Kelompok',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    IconlyLight.time_square,
                    size: 16,
                    color: Colors.black,
                  ),
                  SizedBox(width: 11),
                  Text(
                    'Jam: 09:00 - 16:00 WIB',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
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
                'Deskripsi Acara',
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
      home: DetailAcaraPage(),
    );
  }
}
