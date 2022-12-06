import 'package:firebase_authentication_login_signup/core/services/firebase_service.dart';
import 'package:flutter/material.dart';

import '/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.enableFirebase();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}