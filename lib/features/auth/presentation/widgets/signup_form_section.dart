import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'custom_check_box.dart';

class SignupFormSection extends StatelessWidget {
  const SignupFormSection({super.key});

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
          'Create an Account',
          style: AppStyles.bold20,
        ),
        VerticalSpace(30),
        CustomTextFormField(
          prefixIcon: AppIcons.profileIcon,
          hintText: 'Full Name',
          controller: TextEditingController(),
        ),
        CustomTextFormField(
          prefixIcon: AppIcons.emailIcon,
          hintText: 'Email',
          controller: TextEditingController(),
        ),
        VerticalSpace(16),
        CustomTextFormField(
          prefixIcon: AppIcons.phoneIcon,
          hintText: 'Phone Number',
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.w,
          children: [
            CustomCheckBox(
              onChanged: (val) {},
            ),
            Expanded(
              child: Text(
                'By continuing you accept our Privacy Policy and Term of Use',
                style: AppStyles.regular12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
