class ProgressModel {
  final bool success;
  final List<Data> data;

  ProgressModel({
    required this.success,
    required this.data,
  });

  // Deserialize JSON to ProgressResponse
  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    return ProgressModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((item) => Data.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Data {
  final BeforePhoto beforePhoto;
  final AfterPhoto afterPhoto;
  final double progressPercentage;
  final double weightDifference;
  final int dateDifference;

  Data({
    required this.beforePhoto,
    required this.afterPhoto,
    required this.progressPercentage,
    required this.weightDifference,
    required this.dateDifference,
  });

  // Deserialize JSON to Data
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      beforePhoto:
          BeforePhoto.fromJson(json['beforePhoto'] as Map<String, dynamic>),
      afterPhoto:
          AfterPhoto.fromJson(json['afterPhoto'] as Map<String, dynamic>),
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
      weightDifference: (json['weightDifference'] as num).toDouble(),
      dateDifference: json['dateDifference'] as int,
    );
  }

  // Serialize Data to JSON
  Map<String, dynamic> toJson() {
    return {
      'beforePhoto': beforePhoto.toJson(),
      'afterPhoto': afterPhoto.toJson(),
      'progressPercentage': progressPercentage,
      'weightDifference': weightDifference,
      'dateDifference': dateDifference,
    };
  }
}

class BeforePhoto {
  final String url;
  final DateTime uploadDate;
  final DateTime date;
  final double weight;
  final String facing;
  final String id;

  BeforePhoto({
    required this.url,
    required this.uploadDate,
    required this.date,
    required this.weight,
    required this.facing,
    required this.id,
  });

  // Deserialize JSON to BeforePhoto
  factory BeforePhoto.fromJson(Map<String, dynamic> json) {
    return BeforePhoto(
      url: json['url'] as String,
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      date: DateTime.parse(json['date'] as String),
      weight: (json['weight'] as num).toDouble(),
      facing: json['facing'] as String,
      id: json['_id'] as String,
    );
  }

  // Serialize BeforePhoto to JSON
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'uploadDate': uploadDate.toIso8601String(),
      'date': date.toIso8601String(),
      'weight': weight,
      'facing': facing,
      '_id': id,
    };
  }
}

class AfterPhoto {
  final String url;
  final DateTime uploadDate;
  final DateTime date;
  final double weight;
  final String facing;
  final String id;

  AfterPhoto({
    required this.url,
    required this.uploadDate,
    required this.date,
    required this.weight,
    required this.facing,
    required this.id,
  });

  // Deserialize JSON to AfterPhoto
  factory AfterPhoto.fromJson(Map<String, dynamic> json) {
    return AfterPhoto(
      url: json['url'] as String,
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      date: DateTime.parse(json['date'] as String),
      weight: (json['weight'] as num).toDouble(),
      facing: json['facing'] as String,
      id: json['_id'] as String,
    );
  }

  // Serialize AfterPhoto to JSON
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'uploadDate': uploadDate.toIso8601String(),
      'date': date.toIso8601String(),
      'weight': weight,
      'facing': facing,
      '_id': id,
    };
  }
}
