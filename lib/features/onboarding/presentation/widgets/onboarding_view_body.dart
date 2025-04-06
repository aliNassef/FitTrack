import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import 'onboarding_button_progress.dart';
import 'onboarding_pageview.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingPageView(
          controller: pageController,
          currentPage: currentIndex,
        ),
        OnboardingButtonProgress(controller: pageController)
            .withHorizontalPadding(30),
        VerticalSpace(40),
      ],
    );
  }
}
