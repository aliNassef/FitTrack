class WorkoutModel {
  final String id;
  final String title;
  final int exercises;
  final int duration;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  WorkoutModel({
    required this.id,
    required this.title,
    required this.exercises,
    required this.duration,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      exercises: json['exercises'] as int,
      duration: json['duration'] as int,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'exercises': exercises,
      'duration': duration,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}