class AuthModel {
  final String? name;
  final String? mobile;
  final String? email;
  final String? token;
  final int? id;
  AuthModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.token, this.id,
  });
  factory AuthModel.fromJson(json) {
    return AuthModel(
      id: json['data']['id'],
      name: json['data']['name'],
      mobile: json['data']['mobile'],
      email: json['data']['email'],
      token: json['data']['token'],
    );
  }
}
