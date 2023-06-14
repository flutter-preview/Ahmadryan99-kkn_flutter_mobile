import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/loading_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'penulisan_logbook_screen.dart';

class LogbookScreen extends StatefulWidget {
  @override
  _LogbookScreenState createState() => _LogbookScreenState();
}

class _LogbookScreenState extends State<LogbookScreen> {
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
          'Log Book',
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
            Container(
              height: 3,
              child: isInProgress
                  ? LinearProgressIndicator(
                      minHeight: 3,
                    )
                  : Container(
                      height: 3,
                    ),
            ),
            Expanded(
              child: _buildBody(),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PenulisanPage(),
            ),
          );
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff71D16A),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tambah',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBody() {
    if (isInProgress) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.only(left: 8, top: 20, right: 8),
        itemCount: 30,
        itemBuilder: (_, index) => logbookItem(index: index),
      );
    }
  }

  Widget logbookItem({int? index}) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff71D16A),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$index',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'DES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            'Berangkat Ke Desa Bakung',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          subtitle: Text(
            'Kelompok 1 berangkat bersama-sama ke Desa...',
            style: TextStyle(color: Colors.black, fontSize: 11),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PenulisanPage()),
            );
          },
          selected: true,
        ),
        Divider(),
      ],
    );
  }
}
