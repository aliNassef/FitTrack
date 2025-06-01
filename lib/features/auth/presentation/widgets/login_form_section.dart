import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fit_track_app/core/helpers/show_loading_box.dart';
import 'package:fit_track_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/helpers/show_error_message.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../views/login_view.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(10),
        Text(
          'Hey there,',
          style: AppStyles.regular16,
        ),
        const VerticalSpace(5),
        Text(
          'Welcome Back',
          style: AppStyles.bold20,
        ),
        const VerticalSpace(30),
        CustomTextFormField(
          prefixIcon: AppIcons.emailIcon,
          hintText: 'Email',
          controller: emailController,
        ),
        const VerticalSpace(16),
        CustomTextFormField(
          prefixIcon: AppIcons.lockIcon,
          controller: passwordController,
          hintText: 'Password',
          isPassword: true,
        ),
        const VerticalSpace(10),
        _buildForgetPassword(),
        SizedBox(
          height: context.height * .28,
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              current is LoginSuccess ||
              current is LoginFailure ||
              current is LoginLoading,
          listener: (context, state) {
            if (state is LoginSuccess) {
              _goToLogin();
            } else if (state is LoginFailure) {
              showErrorMessage(context, errMessage: state.errMessage);
            } else if (state is LoginLoading) {
              showLoadingBox(context);
            }
          },
          child: DefaultAppButton(
            icon: SvgPicture.asset(AppIcons.loginIcon),
            onPressed: () {
              context.read<AuthCubit>().login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
            },
            text: 'Login',
          ),
        ),
      ],
    );
  }

  _goToLogin() {
    Navigator.pushNamed(
      context,
      LoginView.routeName,
    );
  }

  TextButton _buildForgetPassword() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot your password?',
        style: AppStyles.medium12.copyWith(
          color: AppColors.greyColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.greyColor,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    );
  }
}
