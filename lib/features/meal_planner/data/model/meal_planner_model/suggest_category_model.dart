class SuggestedCategoryModel {
  final String name;
  final String description;
  final String image;
  final num totalFoods;
  final String id;
  final String mainCategory;
  const SuggestedCategoryModel({
    required this.name,
    required this.description,
    required this.image,
    required this.totalFoods,
    required this.id,
    required this.mainCategory,
  });

  factory SuggestedCategoryModel.fromJson(Map<String, dynamic> json) {
    return SuggestedCategoryModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image']?.toString().trim() ?? '',
      totalFoods: json['totalFoods'] ?? 0,
      id: json['_id'] ?? '',
      mainCategory: json['mainCategory'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'totalFoods': totalFoods,
      '_id': id,
      'mainCategory' : mainCategory
    };
  }
}
