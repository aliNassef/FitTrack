import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/onboarding_model.dart';
import 'onboarding_image_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.currentPage,
    required this.controller,
  });
  final int currentPage;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: boardingItems.length,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnBoardingImageItem(
                image: boardingItems[currentPage].image,
              ),
              VerticalSpace(50),
              Text(
                boardingItems[currentPage].title,
                style: AppStyles.bold24,
              ).withHorizontalPadding(30),
              VerticalSpace(15),
              Text(
                boardingItems[currentPage].description,
                style: AppStyles.regular14.copyWith(
                  color: AppColors.greyLighterColor,
                ),
              ).withHorizontalPadding(30),
            ],
          );
        },
      ),
    );
  }
}
