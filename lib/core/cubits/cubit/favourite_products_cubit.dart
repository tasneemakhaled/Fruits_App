import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_products_state.dart';

class FavouriteProductsCubit extends Cubit<FavouriteProductsState> {
  FavouriteProductsCubit() : super(FavouriteProductsInitial());
}
