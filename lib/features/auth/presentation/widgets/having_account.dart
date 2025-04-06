import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class HavingAccount extends StatelessWidget {
  const HavingAccount(
      {super.key, required this.text, required this.action, this.onTap});
  final String text;
  final String action;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: AppStyles.regular14.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppStyles.regular14.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          TextSpan(
            text: action,
            style: AppStyles.regular14.copyWith(
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (onTap != null) {
                  onTap!();
                }
              },
          ),
        ],
      ),
    );
  }
}
