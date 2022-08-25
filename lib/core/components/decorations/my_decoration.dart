import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponygold/core/constant/app_colors.dart';

import '../../widgets/app_text_style.dart';

class AppDecorations {
  static AnimatedContainer getBorderDecoration(
          {Color? color, double height = 60.0, int duration = 0}) =>
      AnimatedContainer(
          duration: Duration(milliseconds: duration),
          height: height.h,
          width: 6.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(3.r),
              bottomRight: Radius.circular(3.r),
            ),
          ));

  static BoxDecoration blueDecoration({
    Color bodyColor = AppColors.activeColorOfPin,
    Color borderColor = AppColors.activeColorOfPin,
  }) {
    return BoxDecoration(
      color: bodyColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(4.r),
    );
  }

  static BoxDecoration decoWithShadow({double radius = 10.0}) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.colorOfButtonGrey,
              offset: Offset(0.0, 2.0.h),
              blurStyle: BlurStyle.solid,
              blurRadius: 1.0.r,
              spreadRadius: 0.5.r)
        ],
      );
  static InputDecoration defaultDecoration() => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.colorOfButtonGrey,
            width: 0.5.w,
          ),
        ),
        counterText: '',
        focusColor: AppColors.colorOfButtonGrey,
        fillColor: AppColors.colorOfTextform,
        filled: true,
        prefixIcon: const Icon(Icons.phone),
        labelText: "phone".tr(),
        labelStyle: AppTextStyle.medium(size: 14),
      );

  static InputDecoration focusedDecoration() => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.colorOfButtonGrey,
            width: 0.5.w,
          ),
        ),
        counterText: '',
        prefix: Text('+998 ',
            style: AppTextStyle.regular(size: 15, color: AppColors.blackV)),
        focusColor: AppColors.colorOfButtonGrey,
        fillColor: AppColors.colorOfTextform,
        floatingLabelStyle:
            AppTextStyle.medium(size: 17, color: AppColors.grey, height: 0.4),
        filled: true,
        labelText: "phone".tr(),
        labelStyle: AppTextStyle.medium(size: 14),
      );
}
