import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/network/api_service.dart';
import 'package:news_app/core/network/dio_helper.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'package:news_app/features/home/presentation/screens/home_screen.dart';
import 'package:news_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:news_app/features/search/presentation/screens/search_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    BlocProvider(
      create: (_) => SearchCubit(HomeRepo(HomeApiService(DioHelper.dio))),
      child: SearchPage(),
    ),
  ]; // Placeholder for the second page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: AppColors.primaryOrange,
        color: AppColors.textDark,
        backgroundColor: AppColors.white,
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: AppColors.white, size: 30),
          Icon(Icons.search, color: AppColors.white, size: 30),
        ],
      ),
    );
  }
}
