import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class UserInputRow extends StatelessWidget {
  const UserInputRow({
    super.key,
    required this.hint,
    required this.measurement,
    required this.controller,
  });
  final String hint, measurement;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: hint,
            prefixIcon: AppIcons.heightIcon,
            controller: controller,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors:AppGradients.pinkGradient,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            measurement,
            style: AppStyles.medium12.copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
