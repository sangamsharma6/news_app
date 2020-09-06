import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/MainPage.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage(
                  'images/splash.jpg',
                ),
                fit: BoxFit.fitHeight,
              )),
          Center(
            child: Text(
              'NewsKitchen \n by Sangam',
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
