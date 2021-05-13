//@dart=2.9
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_admin/screens/home_screen.dart';
import 'package:shopping_app_admin/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
