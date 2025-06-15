import 'meal_item_model.dart';

class SubcategoryMealModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final List<MealItemModel> meals;

  const SubcategoryMealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.meals,
  });

  factory SubcategoryMealModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryMealModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image']?.toString().trim() ?? '',
      meals: (json['meals'] as List<dynamic>?)
              ?.map((meal) => MealItemModel.fromJson(meal))
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
      'meals': meals.map((meal) => meal.toJson()).toList(),
    };
  }
}
