import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_scheduale_view_body.dart';

class MealSchedualeView extends StatelessWidget {
  const MealSchedualeView({super.key});
  static const String routeName = 'meal-scheduale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const MealSchedualeViewBody().withHorizontalPadding(30),
      ),
      floatingActionButton: _floatingButton(),
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: const Color(0xffC150F6),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
