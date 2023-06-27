import 'package:boilerplate_ui/views/detail_penulisan.dart';
import 'package:boilerplate_ui/views/penulisan_logbook_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogbookScreen extends StatefulWidget {
  @override
  _LogbookScreenState createState() => _LogbookScreenState();
}

class _LogbookScreenState extends State<LogbookScreen> {
  final List<LogbookEntry> logbookEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Book'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: logbookEntries.length,
        itemBuilder: (context, index) {
          LogbookEntry entry = logbookEntries[index];
          String formattedDate = DateFormat('dd').format(entry.date);
          String formattedMonth = DateFormat('MMM').format(entry.date);
          String formattedTime =
              '${entry.time.hour}:${entry.time.minute.toString().padLeft(2, '0')}';

          return ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.grey,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formattedMonth,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: Text(entry.activity),
            subtitle: Text(entry.description),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              _navigateToPenulisanDetail(entry);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToPenulisanPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToPenulisanPage() async {
    LogbookEntry? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PenulisanPage(),
      ),
    );
    if (result != null) {
      setState(() {
        logbookEntries.add(result);
      });
    }
  }

  void _navigateToPenulisanDetail(LogbookEntry entry) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PenulisanDetailScreen(entry: entry),
      ),
    );
  }
}
