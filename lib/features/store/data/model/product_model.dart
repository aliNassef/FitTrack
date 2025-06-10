import 'category_model.dart';

class ProductModel {
  final String id;
  final String name;
  final CategoryModel category;
  final double price;
  final String image;
  final bool inStock;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.inStock,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      inStock: json['inStock'] as bool,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category.toJson(),
      'price': price,
      'image': image,
      'inStock': inStock,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    CategoryModel? category,
    double? price,
    String? image,
    bool? inStock,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      image: image ?? this.image,
      inStock: inStock ?? this.inStock,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
