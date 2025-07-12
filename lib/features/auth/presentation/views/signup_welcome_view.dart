import 'package:flutter/material.dart';
import '../widgets/signup_welcome_view_body.dart';

class SignupWelcomeView extends StatelessWidget {
  const SignupWelcomeView({super.key});
  static const String routeName = 'signup_welcome_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SignupWelcomeViewBody(),
        ),
      ),
    );
  }
}
