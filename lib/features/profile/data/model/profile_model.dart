class ProfileModel {
  final String status;
  final UserProfile data;

  const ProfileModel({required this.status, required this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'] as String,
      data: UserProfile.fromJson(json['data']),
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final String dataOfbirth;
  final num weight;
  final num height;

  const UserProfile({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dataOfbirth,
    required this.weight,
    required this.height,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
      dataOfbirth: json['dateOfBirth'] as String,
      weight: json['weight'] as num,
      height: json['height'] as num,
    );
  }
}
