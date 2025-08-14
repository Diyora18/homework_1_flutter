class SignUpModel {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String birthDate;
  final String password;

  SignUpModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthdate": birthDate,
      "password": password,
    };
  }
}
