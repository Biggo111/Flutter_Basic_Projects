import 'package:appifylab_test/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
       theme: ThemeData(
              scaffoldBackgroundColor: ColorCode.scaffoldBackgroundColor,
              primaryColor: ColorCode.mainColor,
              fontFamily: "Poppins",
              appBarTheme: AppBarTheme(color: ColorCode.appColor),
              secondaryHeaderColor: ColorCode.mainColor),
      home: const HomeScreen(),
    );
  }
}