import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/lottie/loading.json'));
  }
}
