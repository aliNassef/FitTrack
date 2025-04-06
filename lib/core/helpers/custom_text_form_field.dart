import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.hintColor,
    this.isFilled = true,
    this.fillColor = const Color(0xffF7F8F8),
    this.prefixIcon,
  });
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final int maxLines;
  final TextInputType keyboardType;
  final Color? hintColor;
  final bool isFilled;
  final Color? fillColor;
  final String? prefixIcon;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.greyColor,
      obscureText: isSecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      maxLines: widget.maxLines,
      // maxLength: widget.maxLength,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: widget.isFilled ? widget.fillColor : null,
        filled: widget.isFilled,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        hintText: widget.hintText,
        hintStyle: AppStyles.regular12.copyWith(
          color: widget.hintColor ?? AppColors.greyColor,
        ),
        border: buildBorderStyle(
          Color(0xffF7F8F8),
        ),
        enabledBorder: buildBorderStyle(
          Color(0xffF7F8F8),
        ),
        focusedBorder: buildBorderStyle(
          Color(0xffF7F8F8),
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 10, 16),
                child: SvgPicture.asset(widget.prefixIcon!)),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                icon: isSecure
                    ? const Icon(
                        Icons.visibility_sharp,
                        color: AppColors.greyColor,
                        size: 18,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: AppColors.greyColor,
                        size: 18,
                      ),
              )
            : const SizedBox(),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
