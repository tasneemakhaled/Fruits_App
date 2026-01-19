import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
try {
  var res = await dio.get('$baseUrl/user_favorite/t/ar', options: Options(
        headers: {
          // استبدل كلمة YOUR_TOKEN_HERE بالتوكن الحقيقي بتاعك
          'Authorization':  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YmNmY2QzNC0zNWI2LTQzNDktOTdjNS01NjJkNTA1MzdlNzAiLCJqdGkiOiJmZmU5YzkzOGIxZmFkNmIwMTlhYWZhODY4ODQxZjZhNjk2NzM1YTAzOTNiNTYwYTA5Zjk2MGI1NzVlOTQ5YzFlOTdhMGYxMzBiZGQyOWNiZCIsImlhdCI6MTc2ODg2Mjk1My4xODkxMzQsIm5iZiI6MTc2ODg2Mjk1My4xODkxMzYsImV4cCI6MTgwMDM5ODk1My4xODY1NTcsInN1YiI6IjI5NCIsInNjb3BlcyI6W119.XA9xYVVBKokifDV0wGxMmdwycSj7NX_8HEmM97-xX8buaPkN3F7x5nYOKEov3trRmdnBmW5fIVuIFj0cBzx88DHgMAjwPXL7kx6UiXJ1OS-t4VLwY7U4_68y8Celt6CEdYi7jOTAduXxSF5oi7KHRs3hbDth_ZC1Zf7fjdIFgr8m3Gh-kr_mIv-N2xOi8RiPvUxGEqSI-Us3Nh_1RmzqOxBmPMw0e3uRDidccyYfW6jZennCbXVRKENypXC-RbbmTXjuXo7WHWPOXKDKWzJKu8zZxqmoFIzKGcB6bog-XCD_gTy33xhaoyXfOFNjSHgN4PPhOZVei-vT1bhAWJviAo0lHWf93AsWlU5IY59e0KM2LipX7yFO62c2qKliaZE69SDZ919oDxAECJuCTHiB3pjWU3NTl4GLQqLcEPRoeLGVD2F7j5yqGqklm4jroZ0rlxyPMvjuM5RPBF_A2wb04VbWZ2GPLTLhK0ySsRt2NSURsYZTEa1QPO_p_avNnmfAykUf9d1f9OMW03SNAxjB6pcAIpVpShVFJhQKNpAeNA8FtpdZsWyJLy0V3y1GhuaRXBBkjAZ2sQNoFsa0fljRY5lNBYqKiSj4WkBeaL0YqRbfWvB3JDahaRI9OsI54HkniTMkUSqRfKrPERjSqlre0Y2vpEtAY9I-uBDgEA2Nswg', 
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
