import 'package:flutter/material.dart';
import 'package:whats_app_ui/home_screen.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What\'s App Clone',
      home: HomeScreen(),
    ),
  );
}