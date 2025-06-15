import 'daily_meal_model.dart';
import 'nuration_model.dart';
import 'suggest_category_model.dart';

class MealModel {
  final String id;
  final NutritionModel nutrition;
  final List<DailyMealModel> dailyMeals;
  final List<SuggestedCategoryModel> suggestedCategories;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  const MealModel({
    required this.id,
    required this.nutrition,
    required this.dailyMeals,
    required this.suggestedCategories,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['_id'] ?? '',
      nutrition: NutritionModel.fromJson(json['nutrition'] ?? {}),
      dailyMeals: (json['dailyMeals'] as List<dynamic>?)
              ?.map((meal) => DailyMealModel.fromJson(meal))
              .toList() ??
          [],
      suggestedCategories: (json['suggestedCategories'] as List<dynamic>?)
              ?.map((category) => SuggestedCategoryModel.fromJson(category))
              .toList() ??
          [],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'nutrition': nutrition.toJson(),
      'dailyMeals': dailyMeals.map((meal) => meal.toJson()).toList(),
      'suggestedCategories':
          suggestedCategories.map((category) => category.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
