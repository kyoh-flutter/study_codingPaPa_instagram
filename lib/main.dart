import 'package:flutter/material.dart';
import 'package:temp/constans/material_white_color.dart';
import 'package:temp/home_page.dart';
import 'package:temp/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
      // home: const HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
