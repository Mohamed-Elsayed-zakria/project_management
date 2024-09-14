import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

abstract class AppStyle {
  static const TextStyle kTextStyle10 = TextStyle(
    fontSize: 10,
    color: AppColors.kOnSurfaceColor,
  );
  static const TextStyle kTextStyle12 = TextStyle(
    fontSize: 12,
    color: AppColors.kOnSurfaceColor,
  );
  static const TextStyle kTextStyle14 = TextStyle(
    fontSize: 14,
    color: AppColors.kOnSurfaceColor,
  );
  static const TextStyle kTextStyle16 = TextStyle(
    fontSize: 16,
    color: AppColors.kOnSurfaceColor,
  );
  static const TextStyle kTextStyle18 = TextStyle(
    fontSize: 18,
    color: AppColors.kOnSurfaceColor,
  );
  static const TextStyle kTextStyle20 = TextStyle(
    fontSize: 20,
    color: AppColors.kOnSurfaceColor,
  );
  static const TextStyle kTextStyle30 = TextStyle(
    fontSize: 30,
    color: AppColors.kOnSurfaceColor,
  );

  static ThemeData appTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.kSurfaceColor),
      colorScheme: ColorScheme.fromSeed(
        surface: AppColors.kSurfaceColor,
        surfaceTint: AppColors.kSurfaceColor,
        seedColor: AppColors.kPrimaryColor,
        inversePrimary: AppColors.kPrimaryColor,
      ),
      scaffoldBackgroundColor: AppColors.kSurfaceColor,
      useMaterial3: true,
    );
  }
}
