import 'package:flutter/material.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}

