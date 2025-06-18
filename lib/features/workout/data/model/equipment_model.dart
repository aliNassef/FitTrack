class EquipmentModel {
  final String name;
  final String image;
  final String id;

  EquipmentModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel(
      name: json['name'],
      image: json['image'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      '_id': id,
    };
  }
}
