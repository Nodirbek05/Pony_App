import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const String fontFamily = 'SF-Pro';

  // regular style

  static TextStyle regular(
      {double size = 16.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w400,
      height: height.h,
    );
  }
  


  static TextStyle regularwithSpacing(
      {double size = 14.0, Color? color, double height = 1.0}) {
    return TextStyle(
      letterSpacing: 0.5,
      
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w400,
      height: 1.5.h,
    );
  }

  static TextStyle regular1(
      {double size = 16.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
      height: height.h,
    );
  }

  static TextStyle regular2(
      {double size = 13.9, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
      height: height.h,
    );
  }

   static TextStyle regular3(
      {double size = 14.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w400,
      height: height.h,
    );
  }

   static TextStyle regular4(
      {double size = 12.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w400,
      height: height.h,
    );
  }

  static TextStyle medium(
      {double size = 18.0, Color? color, double height = 1.0}) {
    return TextStyle(
      
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w500,
      height: height.h,
    );
  }


  static TextStyle mediumWithUnderdots(
      {double size = 14.0, Color? color, double height = 1.0}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dotted,
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
      height: height.h,
    );
  }

    static TextStyle mediumSmall(
      {double size = 16.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w500,
      height: height.h,
    );
  }

  static TextStyle mediumBig(
      {double size = 20.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w700,
      height: height.h,
    );
  }

  static TextStyle semiBold(
      {double size = 16.0, Color? color, double height = 1.0}) {
    return TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
      height: height.h,
    );
  }

  static TextStyle getButtonStyle({double size = 14.0}) => TextStyle(
        letterSpacing: 0.8.sp,
        // color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: size.sp,
      );
}
