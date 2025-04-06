import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(10),
        Text(
          'Hey there,',
          style: AppStyles.regular16,
        ),
        VerticalSpace(5),
        Text(
          'Welcome Back',
          style: AppStyles.bold20,
        ),
        VerticalSpace(30),
        CustomTextFormField(
          prefixIcon: AppIcons.emailIcon,
          hintText: 'Email',
          controller: TextEditingController(),
        ),
        VerticalSpace(16),
        CustomTextFormField(
          prefixIcon: AppIcons.lockIcon,
          controller: TextEditingController(),
          hintText: 'Password',
          isPassword: true,
        ),
        VerticalSpace(10),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot your password?',
            style: AppStyles.medium12.copyWith(
              color: AppColors.greyColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.greyColor,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ],
    );
  }
}
