import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.blue,
      secondaryHeaderColor: AppColors.black,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: AppColors.white,
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.black),
          titleMedium: TextStyle(color: AppColors.black),
          titleSmall: TextStyle(color: AppColors.black),
          labelLarge: TextStyle(color: AppColors.black),
          labelMedium: TextStyle(color: AppColors.black),
          labelSmall: TextStyle(color: AppColors.black),
          bodyLarge: TextStyle(color: AppColors.black),
          bodyMedium: TextStyle(color: AppColors.black),
          bodySmall: TextStyle(color: AppColors.black)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.blue,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.blue),
              foregroundColor: WidgetStateProperty.all(AppColors.white),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10000))),
              elevation: WidgetStateProperty.all(0),
              textStyle: WidgetStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.white)),
              padding: WidgetStateProperty.all(const EdgeInsets.all(8)))),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
        contentPadding: const EdgeInsets.all(16),
        iconColor: AppColors.blue,
        hintStyle: TextStyle(
            color: AppColors.black[AppColors.colorCode30], fontSize: 14),
        prefixIconColor: AppColors.black,
        suffixIconColor: AppColors.black,
        labelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.black[AppColors.colorCode40],
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.black,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.black,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.red,
            )),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          )),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(AppColors.blue),
          textStyle: WidgetStateProperty.all(const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.blue)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.lightBlue,
        surfaceTintColor: AppColors.blue,
        labelTextStyle:
            WidgetStateProperty.all(const TextStyle(color: AppColors.blue)),
        iconTheme:
            WidgetStateProperty.all(const IconThemeData(color: AppColors.blue)),
        indicatorColor: AppColors.blue[AppColors.colorCode10],
      ),
      checkboxTheme: const CheckboxThemeData(
        // fillColor: WidgetStatePropertyAll(AppColors.blue),
        checkColor: WidgetStatePropertyAll(AppColors.white),
        side: BorderSide(color: AppColors.blue),
        overlayColor: WidgetStatePropertyAll(AppColors.blue),
      )
  );
}
