import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:meta/meta.dart';

part 'get_favourite_products_state.dart';

class FavouriteProductsCubit extends Cubit<FavouriteProductsState> {
  FavouriteProductsCubit() : super(FavouriteProductsInitial());
Dio dio=Dio();
  Future<void>getFavouriteProducts()async{
    emit(FavouriteProductsLoading());
try {
  var res=await dio.get('$baseUrl/user_favorite/t/ar');
  if(res.statusCode==200){
    emit(FavouriteProductsSuccess());
  }
} on Exception catch (e) {
  emit(FavouriteProductsFailure());
}
  }
}
