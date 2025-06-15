 
class MealNutritionModel  {
  final int calories;
  final int fats;
  final int proteins;
  final String id;

  const MealNutritionModel({
    required this.calories,
    required this.fats,
    required this.proteins,
    required this.id,
  });

  factory MealNutritionModel.fromJson(Map<String, dynamic> json) {
    return MealNutritionModel(
      calories: json['calories'] ?? 0,
      fats: json['fats'] ?? 0,
      proteins: json['proteins'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'fats': fats,
      'proteins': proteins,
      '_id': id,
    };
  }
 
}