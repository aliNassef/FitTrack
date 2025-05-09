import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key, required this.gradientColor});
  final List<Color> gradientColor;
  @override
  CustomDropdownButtonState createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  String selectedValue = 'Weekly'; // Default value
  List<String> dropdownItems = ['Daily', 'Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.gradientColor, // Gradient colors from the image
        ),
        borderRadius: BorderRadius.circular(50.0), // Rounded corners
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        icon: Transform.rotate(
          angle: pi * -0.5,
          child: SvgPicture.asset(
            AppIcons.backArrowIcon,
            height: 20.h,
            width: 20.w,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        underline: const SizedBox(), // Remove the default underline
        // Background color of dropdown menu
        dropdownColor: Colors.teal,
        style: AppStyles.medium14.copyWith(
          color: Colors.white,
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },

        items: dropdownItems.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
