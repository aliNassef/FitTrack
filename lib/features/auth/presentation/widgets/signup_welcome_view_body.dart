import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../views/sucess_registration_view.dart';
import 'goal_card_items_list.dart';

class SignupWelcomeViewBody extends StatefulWidget {
  const SignupWelcomeViewBody({
    super.key,
  });

  @override
  State<SignupWelcomeViewBody> createState() => _SignupWelcomeViewBodyState();
}

class _SignupWelcomeViewBodyState extends State<SignupWelcomeViewBody> {
  late CarouselSliderController buttonCarouselController;
  int currentIndex = 0;
  @override
  initState() {
    super.initState();
    buttonCarouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(30),
        Text(
          'What is your goal ?',
          style: AppStyles.bold20,
        ).withHorizontalPadding(30),
        VerticalSpace(5),
        Text(
          'It will help us to choose a best program for you',
          style: AppStyles.regular12.copyWith(
            color: AppColors.greyDeeperColor,
          ),
        ).withHorizontalPadding(30),
        VerticalSpace(50),
        GoalCardItemsList(
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: buttonCarouselController,
        ),
        VerticalSpace(50),
        DefaultAppButton(
          text: 'Confirm',
          onPressed: () {
            if (currentIndex == 2) {
              Navigator.pushNamed(
                context,
                SuccessfulRegistrationView.routeName,
              );
            } else {
              buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
        ).withHorizontalPadding(30),
        VerticalSpace(20),
      ],
    );
  }
}
