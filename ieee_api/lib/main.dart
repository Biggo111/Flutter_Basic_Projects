import 'package:flutter/material.dart';
import 'package:ieee_api/constants/colors.dart';
import 'package:ieee_api/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IEEE API',
      home: MyHomePage(),
    );
  }
}