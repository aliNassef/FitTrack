class ProgressPhotoModel {
  final String url;
  final String uploadDate;
  final String date;
  final int weight;
  final String facing;
  final String id;

  ProgressPhotoModel({
    required this.url,
    required this.uploadDate,
    required this.date,
    required this.weight,
    required this.facing,
    required this.id,
  });

  factory ProgressPhotoModel.fromJson(Map<String, dynamic> json) {
    return ProgressPhotoModel(
      url: json['url'],
      uploadDate: json['uploadDate'],
      date: json['date'],
      weight: json['weight'],
      facing: json['facing'],
      id: json['_id'],
    );
  }
}
