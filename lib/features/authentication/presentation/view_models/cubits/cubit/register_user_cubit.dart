import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/authentication/data/models/auth_model.dart';
import 'package:meta/meta.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit() : super(RegisterUserInitial());
  Dio dio =Dio();
 Future<void> registerUser({required String name,required String mobile,required String password })async{
    emit(RegisterUserLoading());
    try {
  var res= await dio.post('$baseUrl/register',data: {
    'name':name,
    'mobile': mobile,
  
    'password':password,
    'c_password':password,
  });
   if (res.statusCode==200){
    emit(RegisterUserSuccess());
  // return AuthModel.fromJson(res.data);
  
 }else {
        emit(RegisterUserFailure());
      }
}on Exception catch (e) {
   log("Error: $e");
   emit(RegisterUserFailure());
} 

  }

}
