import 'package:boilerplate_ui/views/penulisan_logbook_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PenulisanDetailScreen extends StatelessWidget {
  final LogbookEntry entry;

  const PenulisanDetailScreen({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Penulisan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${entry.activity}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  IconlyLight.time_square,
                  size: 18,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  '${entry.time.hour}:${entry.time.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  IconlyLight.calendar,
                  size: 18,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  '${entry.date.day}/${entry.date.month}/${entry.date.year}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '${entry.description}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PenulisanPage(entry: entry),
            ),
          ).then((updatedEntry) {
            if (updatedEntry != null) {
              // Lakukan sesuatu dengan data yang diperbarui
            }
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
