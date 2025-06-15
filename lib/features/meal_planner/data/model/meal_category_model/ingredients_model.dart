class IngredientModel {
  final String id;
  final String name;
  final String quantity;
  final String image;

  const IngredientModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.image,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? '',
      image: json['image']?.toString().trim() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'quantity': quantity,
      'image': image,
    };
  }
}
