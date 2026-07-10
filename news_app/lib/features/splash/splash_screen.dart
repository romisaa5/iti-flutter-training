import 'package:flutter/material.dart';
import 'package:news_app/features/nav_bar/home_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeNav()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff001F3F),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/splash.png'),
          width: 300,
          height: 200,
        ),
      ),
    );
  }
}
