import 'step_model.dart';
import 'custom_repitition_model.dart';

class ExerciseDetailsModel {
  final String id;
  final String exercise;
  final String title;
  final String description;
  final int totalCaloriesBurned;
  final List<StepModel> steps;
  final List<CustomRepetitionModel> customRepetitions;
  final String video;
  final String createdAt;
  final String updatedAt;
  final int v;

  ExerciseDetailsModel({
    required this.id,
    required this.exercise,
    required this.title,
    required this.description,
    required this.totalCaloriesBurned,
    required this.steps,
    required this.customRepetitions,
    required this.video,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ExerciseDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExerciseDetailsModel(
      id: json['_id'],
      exercise: json['exercise'],
      title: json['title'],
      description: json['description'],
      totalCaloriesBurned: json['totalCaloriesBurned'],
      steps: (json['steps'] as List)
          .map((step) => StepModel.fromJson(step))
          .toList(),
      customRepetitions: (json['customRepetitions'] as List)
          .map((rep) => CustomRepetitionModel.fromJson(rep))
          .toList(),
      video: json['video'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}