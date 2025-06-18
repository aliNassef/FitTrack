class CustomRepetitionModel {
  final int caloriesBurned;
  final int repetitions;
  final String id;

  CustomRepetitionModel({
    required this.caloriesBurned,
    required this.repetitions,
    required this.id,
  });

  factory CustomRepetitionModel.fromJson(Map<String, dynamic> json) {
    return CustomRepetitionModel(
      caloriesBurned: json['caloriesBurned'],
      repetitions: json['repetitions'],
      id: json['_id'],
    );
  }
}
