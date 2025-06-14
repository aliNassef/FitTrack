class DailyMealModel {
  final String name;
  final String category;
  final String time;
  final String image;
  final String id;

  const DailyMealModel({
    required this.name,
    required this.category,
    required this.time,
    required this.image,
    required this.id,
  });

  factory DailyMealModel.fromJson(Map<String, dynamic> json) {
    return DailyMealModel(
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      time: json['time'] ?? '',
      image: json['image']?.toString().trim() ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'time': time,
      'image': image,
      '_id': id,
    };
  }
}
