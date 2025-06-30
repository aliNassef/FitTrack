import 'package:dio/dio.dart';

class UploadImageInputModel {
  final MultipartFile image;
  final String date;
  final double weight;
  final String facing;

  UploadImageInputModel({
    required this.image,
    required this.date,
    required this.weight,
    required this.facing,
  });
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'date': date,
      'weight': weight,
      'facing': facing,
    };
  }
}
