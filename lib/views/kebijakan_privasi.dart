import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class KebijakanPrivasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hubungi Kami'),
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
                'Hubungi kami apabila terdapat kendala dengan aplikasi ini dengan klik disini atau tekan tombol berlogo Whatsapp dibawah. Dengan anda memberi tahu kami apabila terdapat kendala tentang aplikasi ini, kami para Tim Developer sangat terbantu.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Terima Kasih',
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
      home: KebijakanPrivasi(),
    );
  }
}
