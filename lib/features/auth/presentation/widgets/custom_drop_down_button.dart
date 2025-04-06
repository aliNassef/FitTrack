
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
 
class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: SizedBox.shrink(),
      elevation: 1,
      isExpanded: false,
      style: AppStyles.regular12.copyWith(
        color: AppColors.greyColor,
      ),
      items: [
        DropdownMenuItem(
          value: 'Male',
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: 'Female',
          child: Text('Female'),
        )
      ],
      onChanged: (val) {},
      decoration: InputDecoration(
        suffixIcon: Transform.rotate(
          angle: pi / 2,
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            color: AppColors.greyColor,
          ),
        ),
        focusColor: AppColors.greyColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF7F8F8)),
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF7F8F8)),
          borderRadius: BorderRadius.circular(14),
        ),
        prefixIcon: Transform.scale(
          scale: .5,
          child: SvgPicture.asset(AppIcons.genderIcon),
        ),
        hintText: 'Choose Gender',
        fillColor: Color(0xffF7F8F8),
        filled: true,
        hintStyle: AppStyles.regular12.copyWith(
          color: AppColors.greyColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF7F8F8)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
