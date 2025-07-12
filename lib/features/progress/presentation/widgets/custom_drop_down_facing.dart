import 'dart:math';

import 'package:fit_track_app/core/utils/app_colors.dart';
import 'package:fit_track_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownFacing extends StatelessWidget {
  const CustomDropDownFacing({
    super.key,
    required this.facingController,
  });

  final TextEditingController facingController;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const SizedBox.shrink(),
      elevation: 1,
      isExpanded: false,
      style: AppStyles.regular12.copyWith(
        color: AppColors.greyColor,
      ),
      items: [
        const DropdownMenuItem(
          value: Facing.front,
          child: Text('Front'),
        ),
        const DropdownMenuItem(
          value: Facing.back,
          child: Text('Back'),
        ),
        const DropdownMenuItem(
          value: Facing.side,
          child: Text('Side'),
        ),
      ],
      onChanged: (val) {
        switch(val!) {
          case Facing.front:
            facingController.text = 'Front';
            break;
          case Facing.back:
            facingController.text = 'Back';
            break;
          case Facing.side:
            facingController.text = 'Side';
            break;
        }
      },
      decoration: InputDecoration(
        suffixIcon: Transform.rotate(
          angle: pi / 2,
          child: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: AppColors.greyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xffF7F8F8)),
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xffF7F8F8)),
          borderRadius: BorderRadius.circular(14),
        ),
        hintText: 'Facing',
        fillColor: const Color(0xffF7F8F8),
        filled: true,
        hintStyle: AppStyles.regular12.copyWith(
          color: AppColors.greyColor,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color(0xffF7F8F8)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
enum Facing { front, back, side }

