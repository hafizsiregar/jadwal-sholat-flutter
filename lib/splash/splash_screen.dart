import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jadwal_sholat/home/home.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Container(
            height: 500,
            width: 500,
            child: Image.asset('assets/images/icon.png'),
          ),
        ),
      ),
    );
  }

  splashScreen() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return HomePage();
      }));
    });
  }
}
