import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins(
      color: AppColors.blackColor,
    ).fontFamily,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
  );
}
