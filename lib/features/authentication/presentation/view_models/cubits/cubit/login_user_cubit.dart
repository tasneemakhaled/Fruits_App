import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:meta/meta.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitial());
  Dio dio = Dio();

  Future<void> loginUser({
    required String phone_email,
    required String password,
  }) async {
    emit(LoginUserLoading());
    try {
      var res = await dio.post(
        '$baseUrl/login',
        data: {'phone_email': phone_email, 'password': password},
      );
      if (res.statusCode == 200) {
        // Dio يحول البيانات تلقائياً لـ Map، لا تستخدمي json.decode
        final body = res.data; 
        String token = body['data']['token'];

        await storage.write(key: 'user_token', value: token);
        print("Token Saved Successfully: $token"); // للتأكد
        emit(LoginUserSuccess());
      }
    } on Exception catch (e) {
      log("Error: $e");
      emit(LoginUserFailure());
    }
  }
}
