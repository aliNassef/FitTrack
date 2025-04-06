import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  // Utility method to create styles
  static TextStyle _createStyle({
    required String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.getFont(
      fontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  // Poppins Font
  static final semiBold10 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
  static final regular10 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static final regular11 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
  static final bold11 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );
  static final regular12 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final medium12 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final bold13 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
  static final regular14 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final medium14 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final semiBold14 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final semiBold15 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static final regular16 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final medium16 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final semiBold18 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final regular18 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static final medium18 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final regular20 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final semiBold20 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final bold20 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static final medium20 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static final regular24 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static final medium24 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static final semiBold24 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static final bold24 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static final bold26 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static final bold32 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static final medium30 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static final semiBold32 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static final medium32 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );
  static final regular32 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );
  static final semiBold36 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );
  static final bold36 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );
  static final bold40 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );
  static final bold48 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );

  static final bold16 = _createStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
