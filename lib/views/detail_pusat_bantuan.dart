import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/loading_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'penulisan_logbook_screen.dart';

class PusatBantuan extends StatefulWidget {
  @override
  _PusatBantuanState createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
  bool isInProgress = false;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pusat Bantuan',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refresh,
        backgroundColor: Colors.white,
        color: Colors.blue,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Apakah bisa mengganti NIM',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Apakah Bisa Mengganti Nama',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bagaimana cara upload Logbook?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bagaimana cara upload Logbook?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bagaimana cara upload Video KKN?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bagaimana cara mengganti password?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bagaimana cara menghubungi Admin?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
            ListTile(
              title: Text(
                'Bagaimana cara mengupload Acara',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              selected: true,
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        child: Container(
          width: 60,
          height: 60,
          child: Image.asset('assets/images/buttonWa.png'),
        ),
      ),
    );
  }
}
