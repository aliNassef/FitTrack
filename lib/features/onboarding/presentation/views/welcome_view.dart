import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'onboarding_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  static const String routeName = 'welcome_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppGradients.pinkGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              AppImages.logo,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffB8B2B2),
                  ],
                ).createShader(bounds);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'FIT',
                      style: AppStyles.bold36.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Track',
                      style: AppStyles.bold36,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Everyone can be Fit and Healthy',
              style: AppStyles.regular18.copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            DefaultAppButton(
              text: 'Get Started',
              onPressed: () => _goToOnboardingPage(context),
            ).withHorizontalPadding(30),
            const VerticalSpace(40),
          ],
        ),
      ),
    );
  }

  void _goToOnboardingPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      OnboardingView.routeName,
    );
  }
}
