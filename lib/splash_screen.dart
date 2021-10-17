// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_catches

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:weather_app/weather_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

//  startTime();
  startTime() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WeatherScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF16173B),
              Color(0xFF35376F),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.3, 0.9]),
      ),
      child: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_dw8rzsix.json'),
    );
  }
}

// #35376F
// #16173B