import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class SuccessfulRegistrationView extends StatelessWidget {
  const SuccessfulRegistrationView({super.key});
  static const routeName = 'sucessRegistrationView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            VerticalSpace(50),
            Image.asset(
              AppImages.successRegister,
              height: context.height * 0.45,
              width: context.width,
              fit: BoxFit.fill,
            ),
            VerticalSpace(40),
            Text(
              'Welcome, Stefani',
              style: AppStyles.bold20,
            ),
            VerticalSpace(5),
            Text(
              'You are all set now, let’s reach your goals together with us',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyDeeperColor,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            DefaultAppButton(
              text: 'Go to Home',
              onPressed: () {},
            ),
            VerticalSpace(20),
          ],
        ).withHorizontalPadding(30),
      ),
    );
  }
}
