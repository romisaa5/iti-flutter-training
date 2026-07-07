import 'package:flutter/material.dart';
import 'package:store_app/features/nav_bar/custom_nav_bar.dart';
import 'package:store_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CustomNavBar());
  }
}
