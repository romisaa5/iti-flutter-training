import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/di/service_locater.dart';
import 'package:iti_final_project/core/helpers/app_navigator.dart';
import 'package:iti_final_project/core/network/dio_helper.dart';
import 'package:iti_final_project/core/theme/app_colors/light_theme_data.dart';
import 'package:iti_final_project/features/login/presentation/screens/login_screen.dart';
import 'package:iti_final_project/features/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await DioHelper.init();
  await setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(context),
        );
      },
    );
  }
}
