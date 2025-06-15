class NutritionModel {
  final int calories;
  final int protein;
  final int fat;
  final int carbs;
  final int fiber;
  final int sugar;
  final String id;

  const NutritionModel({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    required this.fiber,
    required this.sugar,
    required this.id,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json['calories'] ?? 0,
      protein: json['protein'] ?? 0,
      fat: json['fat'] ?? 0,
      carbs: json['carbs'] ?? 0,
      fiber: json['fiber'] ?? 0,
      sugar: json['sugar'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
      'fiber': fiber,
      'sugar': sugar,
      '_id': id,
    };
  }
}
