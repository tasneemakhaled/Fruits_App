import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/core/utils/models/get_favourite_products_model/datum_favourite.dart';
import 'package:fruit_app/core/utils/models/get_favourite_products_model/get_favourite_products_model.dart';
import 'package:meta/meta.dart';

part 'get_favourite_products_state.dart';

class FavouriteProductsCubit extends Cubit<FavouriteProductsState> {
  FavouriteProductsCubit() : super(FavouriteProductsInitial());
  
Dio dio=Dio();
  Future<void>getFavouriteProducts()async{
    emit(FavouriteProductsLoading());
    String? token = await storage.read(key: 'user_token');
try {
  var res = await dio.get('$baseUrl/user_favorite/t/ar', options: Options(
        headers: {
          // استبدل كلمة YOUR_TOKEN_HERE بالتوكن الحقيقي بتاعك
          'Authorization':  'Bearer $token', 
          'Accept': 'application/json',
        },
      ),
  );
      if (res.statusCode == 200) {
        // 2. معالجة المشكلة هنا
        dynamic responseData = res.data;

        // لو الداتا جاية نص (String) حولها لـ Map
        if (responseData is String) {
          responseData = jsonDecode(responseData);
        }

        // دلوقتي نقدر نستخدم الـ FromJson وأحنا مطمنين
        GetFavouriteProductsModel model = GetFavouriteProductsModel.fromJson(responseData);
        
        emit(FavouriteProductsSuccess(favouriteProducts: model.data ?? []));
  }
} on Exception catch (e) {
  emit(FavouriteProductsFailure(e.toString()));
}
  }
}
