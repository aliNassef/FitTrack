class SignupInputModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? gender;
  final String? dateOfBirth;
  final num? weight;
  final num? height;
  final bool? termsAccepted;

  SignupInputModel({
    this.termsAccepted,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.gender,
    this.dateOfBirth,
    this.weight,
    this.height,
  });

  toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'weight': weight,
        'height': height,
        'termsAccepted': termsAccepted,
      };
}
