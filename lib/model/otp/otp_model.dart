class UserModel {
  String phoneNumber;
  UserModel({
    required this.phoneNumber,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "phoneNumber": phoneNumber,
    };
  }
}
