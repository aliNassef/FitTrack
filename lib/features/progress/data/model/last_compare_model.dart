class SimplePhotoCompareModel {
  final String url;
  final int weight;
  final String date;

  SimplePhotoCompareModel({
    required this.url,
    required this.weight,
    required this.date,
  });

  factory SimplePhotoCompareModel.fromJson(Map<String, dynamic> json) {
    return SimplePhotoCompareModel(
      url: json['url'],
      weight: json['weight'],
      date: json['date'],
    );
  }
}

class LastCompareModel {
  final SimplePhotoCompareModel before;
  final SimplePhotoCompareModel after;
  final int weightDifference;
  final int progressPercentage;
  final int dateDifference;

  LastCompareModel({
    required this.before,
    required this.after,
    required this.weightDifference,
    required this.progressPercentage,
    required this.dateDifference,
  });

  factory LastCompareModel.fromJson(Map<String, dynamic> json) {
    return LastCompareModel(
      before: SimplePhotoCompareModel.fromJson(json['before']),
      after: SimplePhotoCompareModel.fromJson(json['after']),
      weightDifference: json['weightDifference'],
      progressPercentage: json['progressPercentage'],
      dateDifference: json['dateDifference'],
    );
  }
}