 
import 'sub_category_meal_model.dart';

class CategoryMealModel {
  final String id;
  final String name;
  final List<SubcategoryMealModel> subcategories;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  const CategoryMealModel({
    required this.id,
    required this.name,
    required this.subcategories,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CategoryMealModel.fromJson(Map<String, dynamic> json) {
    return CategoryMealModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((subcategory) => SubcategoryMealModel.fromJson(subcategory))
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
      'name': name,
      'subcategories': subcategories.map((subcategory) => subcategory.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
 
}