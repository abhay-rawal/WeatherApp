import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/landing.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: TodaysWeather(),
        ),
      ),
    );
  }
}
