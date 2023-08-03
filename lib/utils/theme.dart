import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.c_13181F,
    appBarTheme:  AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black54),
      elevation: 0,
      backgroundColor: AppColors.c_13181F,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.c_13181F,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,

      ),
    ),
    textTheme: TextTheme(
      //display
      displayLarge: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 57.sp,
          fontWeight: FontWeight.w800,
          fontFamily: "DMSans"),
      displayMedium: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "DMSans"),
      displaySmall: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "DMSans"),
      //headline
      headlineLarge: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "DMSans"),
      headlineMedium: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      headlineSmall: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "DMSans"),
      //title
      titleLarge: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "DMSans"),
      titleMedium: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "DMSans"),
      titleSmall: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      //label
      labelLarge: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "DMSans"),
      labelMedium: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      labelSmall: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      //body
      bodySmall:  TextStyle(
          color: AppColors.textColorDark,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      bodyMedium: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      bodyLarge: TextStyle(
          color: AppColors.textColorDark,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
    ),
  );
  static ThemeData lightTheme =ThemeData(
    scaffoldBackgroundColor: AppColors.c_FAFAFA,
    appBarTheme:  AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black54),
      elevation: 0,
      backgroundColor: AppColors.c_FAFAFA,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.c_FAFAFA,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      //display
      displayLarge: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 57.sp,
          fontWeight: FontWeight.w800,
          fontFamily: "DMSans"),
      displayMedium: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "DMSans"),
      displaySmall: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "DMSans"),
      //headline
      headlineLarge: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "DMSans"),
      headlineMedium: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      headlineSmall: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "DMSans"),
      //title
      titleLarge: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "DMSans"),
      titleMedium: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "DMSans"),
      titleSmall: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      //label
      labelLarge: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "DMSans"),
      labelMedium: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      labelSmall: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      //body
      bodySmall:  TextStyle(
          color: AppColors.textColorLight,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      bodyMedium: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
      bodyLarge: TextStyle(
          color: AppColors.textColorLight,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "DMSans"),
    ),
  );
}