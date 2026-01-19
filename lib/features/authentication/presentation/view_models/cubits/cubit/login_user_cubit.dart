import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
        emit(LoginUserSuccess());
        // return AuthModel.fromJson(res.data);
      }
    } on Exception catch (e) {
      log("Error: $e");
      emit(LoginUserFailure());
    }
  }
}
