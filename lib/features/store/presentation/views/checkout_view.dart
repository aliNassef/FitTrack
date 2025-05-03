import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = 'checkout_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: const CheckoutViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
