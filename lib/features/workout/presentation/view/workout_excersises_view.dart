import 'package:flutter/material.dart';

import '../widgets/workout_excersises_view_body.dart';

class WorkoutExerciseView extends StatelessWidget {
  const WorkoutExerciseView({super.key});
  static const routeName = 'workout-excersises-view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WorkoutExerciseViewBody(),
      ),
    );
  }
}
