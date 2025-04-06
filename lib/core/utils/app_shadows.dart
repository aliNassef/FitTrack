import 'package:flutter/material.dart';

abstract class AppShadows {
  // Shadow 1
  static BoxShadow shadow1 = BoxShadow(
    blurRadius: 4,
    offset: const Offset(4, 4),
    color: Colors.black.withValues(alpha: 0.2),
  );

  // Shadow 2
  static BoxShadow shadow2 = BoxShadow(
    color: Colors.black.withValues(alpha: 0.25),
    blurRadius: 4,
    offset: const Offset(0, 4),
  );

  // Shadow 3
  static BoxShadow shadow3 = BoxShadow(
    color: Colors.transparent.withValues(alpha: 0.08),
    blurRadius: 10,
    offset: const Offset(0, 0),
  );

  // Shadow 4
  static BoxShadow shadow4 = BoxShadow(
    color: Colors.transparent.withValues(alpha: 0.08),
    blurRadius: 8,
    offset: const Offset(0, 0),
  );

  // Shadow 5
  static BoxShadow shadow5 = BoxShadow(
    color: Colors.transparent.withValues(alpha: 0.08),
    blurRadius: 10,
    offset: const Offset(0, 0),
  );

  // Shadow 6
  static BoxShadow shadow6 = BoxShadow(
    color: Color(0xFF000000).withValues(alpha: 0.14),
    blurRadius: 14,
    offset: const Offset(0, 0),
  );
  static BoxShadow shadow7 = BoxShadow(
    color: Color(0xFF101828).withValues(alpha: .06), // 6% opacity
    offset: Offset(0, 2), // X: 0, Y: 2
    blurRadius: 4, // Blur: 4
    spreadRadius: -2, // Spread: -2
  );

  static BoxShadow shadow8 = BoxShadow(
    color: Color(0xFF101828).withValues(alpha: 0.1), // 10% opacity
    offset: Offset(0, 4), // X: 0, Y: 4
    blurRadius: 8, // Blur: 8
    spreadRadius: -2, // Spread: -2
  );
}
