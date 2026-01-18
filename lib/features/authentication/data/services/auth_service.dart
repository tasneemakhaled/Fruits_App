import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/data/models/auth_model.dart';

class AuthService {
Dio dio =Dio();
 Future<AuthModel?> registerUser({required String name,required String mobile,required String email,required String password })async{
    
    try {
  var res= await dio.post('$baseUrl/register',data: {
    'name':name,
    'mobile': mobile,
    'email':email,
    'password':password,
    'c_password':password,
  });
   if (res.statusCode==200){
  return AuthModel.fromJson(res.data);
 }
}on Exception catch (e) {
   log("Error: $e");
   
} 
return null;
  }


 Future<AuthModel?> loginUser({required String phone_email,required String password})async{
  try{
 var res= await dio.post('$baseUrl/login',data: {
    'phone_email':phone_email,
    'password':password,
  });
    if (res.statusCode==200){
  return AuthModel.fromJson(res.data);
 }
}on Exception catch (e) {
   log("Error: $e");
}
return null;
  }

   Future<AuthModel?> ForgetPasswordUser({required String email})async{
  try{
 var res= await dio.post('$baseUrl/forget_pass_user',data: {
    'email':email,
  });
    if (res.statusCode==200){
  return AuthModel.fromJson(res.data);
 }
}on Exception catch (e) {
   log("Error: $e");
}
return null;
  }

}