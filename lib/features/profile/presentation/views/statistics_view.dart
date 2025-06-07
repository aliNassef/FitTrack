import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import '../widgets/statistics_view_body.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});
  static const String routeName = 'statistics_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: const StatisticsViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
