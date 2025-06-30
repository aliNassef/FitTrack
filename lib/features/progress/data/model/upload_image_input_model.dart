import 'package:image_picker/image_picker.dart';

class UploadImageInputModel {
  final XFile image;
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
      'image': image.path,
      'date': date,
      'weight': weight,
      'facing': facing,
    };
  }
}
