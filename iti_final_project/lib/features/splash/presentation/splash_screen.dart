import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/helpers/app_navigator.dart';
import 'package:iti_final_project/features/login/presentation/screens/login_screen.dart';
import 'package:iti_final_project/features/nav_bar/custom_bottom_nav.dart';
import 'package:lottie/lottie.dart';
import 'cubit/splash_cubit.dart';
import 'cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoggedIn) {
            AppNavigator.pushAndRemoveUntil(const CustomBottomNav());
          } else if (state is SplashLoggedOut) {
            AppNavigator.pushAndRemoveUntil(const LoginScreen());
          }
        },
        child: Scaffold(
          body: Center(
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
