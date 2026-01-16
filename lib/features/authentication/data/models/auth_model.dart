class AuthModel {
  final String? name;
  final String? mobile;
  final String? email;
  final String? token;

  AuthModel({required this.name, required this.mobile, required this.email, required this.token, });
factory AuthModel.fromJson(json){
  return AuthModel(
    name: json['data']['name'],
    mobile: json['data']['mobile'],
    email: json['data']['email'],
     token: json['data']['token'],
     );
}
 }