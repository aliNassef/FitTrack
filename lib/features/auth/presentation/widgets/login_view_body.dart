import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_router.dart';
import '../views/signup_view.dart';
import 'custom_or_dvider.dart';
import 'having_account.dart';
import 'login_form_section.dart';
import 'social_signing.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: LoginFormSection(),
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
                onTap: () => _goToRegister(context),
                text: 'Don\'t have an account yet?',
                action: 'Register',
              ),
              const VerticalSpace(20),
            ],
          ),
        ),
      ],
    ).withHorizontalPadding(16);
  }

  _goToRegister(BuildContext context) {
    Navigator.push(
      context,
      goToPageWithAnimation(
        const SignupView(),
      ),
    );
  }
}
