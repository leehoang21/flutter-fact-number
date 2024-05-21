import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme_color.dart';

// ignore: avoid_classes_with_only_static_members
class ThemeText {
  static TextStyle bodySmall = TextStyle(
    fontSize: 14.sp,
    color: AppColor.textColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 24.sp,
    color: AppColor.textColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 50.sp,
    color: AppColor.textColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle titleApp = TextStyle(
    fontSize: 42.sp,
    color: AppColor.taupeGray,
    fontWeight: FontWeight.bold,
  );
}

class ThemeTextDark {
  static TextStyle button = TextStyle(
    fontSize: 14.sp,
    color: AppColor.textColorDark,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 14.sp,
    color: AppColor.textColorDark,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 24.sp,
    color: AppColor.textColorDark,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 50.sp,
    color: AppColor.textColorDark,
    fontWeight: FontWeight.bold,
  );

  static TextStyle titleApp = TextStyle(
    fontSize: 42.sp,
    color: AppColor.lightGrey,
    fontWeight: FontWeight.bold,
  );
}
