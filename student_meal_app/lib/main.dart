import 'package:flutter/material.dart';

import 'categories_screens.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Meal System',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   bodyText1: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
        //   bodyText2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
        //   titleMedium: TextStyle(
        //     fontSize: 24,
        //     fontFamily: 'RobotoCondensed',
        //   ),
        // ),
      ),
      home: CategoriesScreen(),
    );
  }
}