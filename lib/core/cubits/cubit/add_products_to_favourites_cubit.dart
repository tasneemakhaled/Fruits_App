import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:meta/meta.dart';

part 'add_products_to_favourites_state.dart';

class AddProductsToFavouritesCubit extends Cubit<AddProductsToFavouritesState> {
  AddProductsToFavouritesCubit() : super(AddProductsToFavouritesInitial());
Dio dio=Dio();
  Future<void> addProductToFavourites()async{
    emit(AddProductsToFavouritesLoading());
  try {
  var res=await dio.post('$baseUrl/user_favorite');
  if(res.statusCode==200){
    emit(AddProductsToFavouritesSuccess());
  }
} on Exception catch (e) {
  emit(AddProductsToFavouritesFailure());
}
  }
}
