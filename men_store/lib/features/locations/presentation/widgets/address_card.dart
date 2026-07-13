import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDefault;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDefault = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: LightAppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected
                ? LightAppColors.primary600
                : LightAppColors.grey300,
            width: isSelected ? 1.6.w : 1.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 24.sp,
              color: LightAppColors.grey700,
            ),

            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.font14Bold.copyWith(
                          color: LightAppColors.neutral900,
                        ),
                      ),
                      // if (isDefault) ...[
                      //   SizedBox(width: 8.w),
                      //   Container(
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: 8.w,
                      //       vertical: 2.h,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: LightAppColors.grey200,
                      //       borderRadius: BorderRadius.circular(20.r),
                      //     ),
                      //     child: Text(
                      //       'Default',
                      //       style: AppTextStyles.font12Regular.copyWith(
                      //         color: LightAppColors.grey700,
                      //       ),
                      //     ),
                      //   ),
                      // ],
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font13Regular.copyWith(
                      color: LightAppColors.grey700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
