import 'package:flutter/material.dart';

abstract class AppShadows {
  // Shadow 1
  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: const Color(0xff1D1617).withValues(alpha: 0.07),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];
}
