import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_images.dart';
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
        SliverToBoxAdapter(
          child: LoginFormSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: context.height * .28,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultAppButton(
                icon: SvgPicture.asset(AppIcons.loginIcon),
                onPressed: () {},
                text: 'Login',
              ),
              VerticalSpace(20),
              CustomOrDvider(),
              VerticalSpace(20),
              SocialSigning(),
              VerticalSpace(30),
              HavingAccount(
                onTap: () => _goToRegister(context),
                text: 'Don\'t have an account yet?',
                action: 'Register',
              ),
              VerticalSpace(20),
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
        SignupView(),
      ),
    );
  }
}
