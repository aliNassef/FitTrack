import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.icon = const SizedBox(),
    this.padding = 0,
    this.radius = 99,
  });
  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final Widget icon;
  final double padding;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: padding),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              style: AppStyles.bold16.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
