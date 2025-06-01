class SignupModel {
  final String status;
  final String message;
  final SignupData data;

  SignupModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: SignupData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class SignupData {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final DateTime dateOfBirth;
  final int weight;
  final int height;

  SignupData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      weight: json['weight'] as int,
      height: json['height'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'weight': weight,
      'height': height,
    };
  }
}