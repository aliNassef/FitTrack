import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../widgets/complete_profile_view_body.dart';

class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});
  static const String routeName = 'complete_profile_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CompleteProfileViewBody().withHorizontalPadding(16),
        ),
      ),
    );
  }
}
