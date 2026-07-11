import 'package:flutter/material.dart';
import 'package:store_app/core/style/app_colors.dart';

import 'font_weight_helper.dart';

class AppTextStyles {
  const AppTextStyles._();
  static TextStyle font12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    letterSpacing: 0.5,
  );

  static TextStyle font12SemiBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.semiBold,
    letterSpacing: 0.5,
  );

  static TextStyle font12Bold = TextStyle(
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.5,
  );

  static TextStyle font13Regular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16SemiBold = TextStyle(
    fontSize: 16,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.semiBold,
    letterSpacing: 0.5,
  );

  static TextStyle font20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.5,
  );

  static TextStyle font32Bold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.5,
  );
}
