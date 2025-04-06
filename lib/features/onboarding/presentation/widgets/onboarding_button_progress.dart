import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

import '../../../../core/utils/app_colors.dart';
import '../../../auth/presentation/views/signup_view.dart';
import '../../data/model/onboarding_model.dart';

class OnboardingButtonProgress extends StatelessWidget {
  const OnboardingButtonProgress({
    super.key,
    required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => _goToNextPage(context),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor,
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: CircularProgressIndicator(
                  value: boardingItems[controller.page?.toInt() ?? 0].progress,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _goToNextPage(BuildContext context) {
    if (controller.page!.toInt() == boardingItems.length - 1) {
      Navigator.pushReplacementNamed(context, SignupView.routeName);
    } else {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
