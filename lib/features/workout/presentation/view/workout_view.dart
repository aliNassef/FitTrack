import 'package:flutter/material.dart';

import '../widgets/workout_view_body.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});
  static const String routeName = 'workout-view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WorkoutViewBody(),
    );
  }
}
