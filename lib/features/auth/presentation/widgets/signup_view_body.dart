import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_router.dart';
import '../views/login_view.dart';
import 'custom_or_dvider.dart';
import 'having_account.dart';
import 'signup_form_section.dart';
import 'social_signing.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SignupFormSection(),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace(20),
              const CustomOrDvider(),
              const VerticalSpace(20),
              const SocialSigning(),
              const VerticalSpace(30),
              HavingAccount(
                onTap: () => _goToLogin(context),
                text: 'Already have an account?',
                action: 'Login',
              ),
              const VerticalSpace(20),
            ],
          ),
        ),
      ],
    ).withHorizontalPadding(16);
  }

  _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      goToPageWithAnimation(
        const LoginView(),
      ),
    );
  }
}
