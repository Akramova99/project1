class AuthModel {
  String? name;
  String? surname;
  String? phone;
  String? password;
  String? photoId;
  String? signature;

  AuthModel({
    required this.name,
    required this.surname,
    required this.password,
    required this.phone,
    required this.photoId,
    required this.signature,
  });

  AuthModel.fromJson(Map<String, dynamic> mp)
      : name = mp["name"],
        surname = mp["surname"],
        password = mp["password"],
        phone = mp["phone"],
        photoId = mp["photoId"],
        signature = mp["signature"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "password": password,
        "phone": phone,
        "photoId": photoId,
        "signature": signature
      };
}
