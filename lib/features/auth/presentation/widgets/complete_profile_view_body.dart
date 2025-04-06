import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../views/signup_welcome_view.dart';
import 'custom_drop_down_button.dart';
import 'user_input_row.dart';

class CompleteProfileViewBody extends StatelessWidget {
  const CompleteProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        VerticalSpace(20),
        Text(
          'Let’s complete your profile',
          style: AppStyles.bold20,
          textAlign: TextAlign.center,
        ),
        VerticalSpace(5),
        Text(
          'It will help us to know more about you!',
          style: AppStyles.regular12,
          textAlign: TextAlign.center,
        ),
        VerticalSpace(context.height * .16),
        CustomDropDownButton(),
        VerticalSpace(13),
        CustomTextFormField(
          hintText: 'Date of Birth',
          prefixIcon: AppIcons.dateIcon,
          controller: TextEditingController(),
        ),
        VerticalSpace(13),
        UserInputRow(
          controller: TextEditingController(),
          hint: 'Your Weight',
          measurement: 'KG',
        ),
        VerticalSpace(13),
        UserInputRow(
          controller: TextEditingController(),
          hint: 'Your Height',
          measurement: 'CM',
        ),
        VerticalSpace(context.height * .16),
        DefaultAppButton(
          text: 'Next',
          onPressed: () {
            _goToGoalItems(context);
          },
        ),
      ],
    );
  }

  void _goToGoalItems(BuildContext context) {
    Navigator.pushNamed(
      context,
      SignupWelcomeView.routeName,
    );
  }
}
