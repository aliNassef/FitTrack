import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static const String routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: const HomeViewBody().withHorizontalPadding(30),
      ),
    );
  }
}
