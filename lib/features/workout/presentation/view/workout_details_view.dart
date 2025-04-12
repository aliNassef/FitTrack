import 'package:flutter/material.dart';
import '../widgets/workout_details_view_body.dart';

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({super.key});
  static const String routeName = 'workoutDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorkoutDetailsViewBody(),
    );
  }
}
