import 'data.dart';

class ProductModel {
  bool? status;
  String? message;
  Data? data;

  ProductModel({this.status, this.message, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}
