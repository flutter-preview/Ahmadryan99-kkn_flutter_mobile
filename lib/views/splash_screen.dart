import 'dart:async';

import 'package:boilerplate_ui/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(
          seconds: 5,
        ), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_logo.png',
              height: 142,
              width: 128,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'KKN UNU',
              style: GoogleFonts.openSans(
                  color: const Color(0xffFFFFFF),
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              'BLITAR',
              style: GoogleFonts.openSans(
                  color: const Color(0xffFFFFFF),
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
