import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:meta/meta.dart';

part 'add_products_to_favourites_state.dart';

class AddProductsToFavouritesCubit extends Cubit<AddProductsToFavouritesState> {
  AddProductsToFavouritesCubit() : super(AddProductsToFavouritesInitial());
Dio dio=Dio();
  Future<void> addProductToFavourites({required int favProductId})async{
    emit(AddProductsToFavouritesLoading());
    String? token = await storage.read(key: 'user_token');
      print("Sending Token: $token"); 
  try {
  var res=await dio.post('$baseUrl/user_favorite',data: {
    'favo_id':favProductId,
  },
   options: Options(
        headers: {
         
          'Authorization': 'Bearer $token', 
          'Accept': 'application/json',
        },
      ),
  );
  if(res.statusCode==200){
    emit(AddProductsToFavouritesSuccess());
  }
} on Exception catch (e) {
  emit(AddProductsToFavouritesFailure(errorMessage: e.toString()));
}
  }
}
