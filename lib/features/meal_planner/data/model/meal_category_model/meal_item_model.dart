import '../../../../../core/model/step_model.dart';
import 'ingredients_model.dart';
import 'meal_nutrition_model.dart';

class MealItemModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final int calories;
  final String difficulty;
  final String time;
  final bool isRecommended;
  final bool isPopular;
  final MealNutritionModel? nutrition;
  final List<IngredientModel> ingredients;
  final List<StepModel> steps;

  const MealItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.calories,
    required this.difficulty,
    required this.time,
    required this.isRecommended,
    required this.isPopular,
    this.nutrition,
    required this.ingredients,
    required this.steps,
  });

  factory MealItemModel.fromJson(Map<String, dynamic> json) {
    return MealItemModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image']?.toString().trim() ?? '',
      calories: json['calories'] ?? 0,
      difficulty: json['difficulty'] ?? '',
      time: json['time'] ?? '',
      isRecommended: json['isRecommended'] ?? false,
      isPopular: json['isPopular'] ?? false,
      nutrition: json['nutrition'] != null
          ? MealNutritionModel.fromJson(json['nutrition'])
          : null,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((ingredient) => IngredientModel.fromJson(ingredient))
              .toList() ??
          [],
      steps: (json['steps'] as List<dynamic>?)
              ?.map((step) => StepModel.fromJson(step))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'image': image,
      'calories': calories,
      'difficulty': difficulty,
      'time': time,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'nutrition': nutrition?.toJson(),
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'steps': steps.map((step) => step.toJson()).toList(),
    };
  }
}
