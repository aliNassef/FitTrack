class ExerciseModel {
  final String id;
  final String workout;
  final String title;
  final int duration;
  final int repetitions;
  final String? image;
  final String difficulty;
  final int caloriesBurned;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExerciseModel({
    required this.id,
    required this.workout,
    required this.title,
    required this.duration,
    required this.repetitions,
    this.image,
    required this.difficulty,
    required this.caloriesBurned,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['_id'],
      workout: json['workout'],
      title: json['title'],
      duration: json['duration'],
      repetitions: json['repetitions'],
      image: json['image'],
      difficulty: json['difficulty'],
      caloriesBurned: json['caloriesBurned'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'workout': workout,
      'title': title,
      'duration': duration,
      'repetitions': repetitions,
      'image': image,
      'difficulty': difficulty,
      'caloriesBurned': caloriesBurned,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
