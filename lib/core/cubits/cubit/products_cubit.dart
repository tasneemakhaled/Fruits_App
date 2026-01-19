import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/core/utils/models/product_model/product_model.dart'; // تأكد من المسار
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  Dio dio = Dio();

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      var res = await dio.get('$baseUrl/product/get/ar');
      if (res.statusCode == 200) {
        // تحويل الـ JSON القادم من Dio إلى الموديل
        ProductModel productModel = ProductModel.fromJson(res.data);
        emit(ProductsSuccess(productModel));
      } else {
        emit(ProductsFailure('حدث خطأ ما في السيرفر'));
      }
    } catch (e) {
      log(e.toString());
      emit(ProductsFailure('تعذر تحميل البيانات: $e'));
    }
  }
}
