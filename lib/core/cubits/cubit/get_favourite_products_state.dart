part of 'get_favourite_products_cubit.dart';

@immutable
sealed class FavouriteProductsState {}

final class FavouriteProductsInitial extends FavouriteProductsState {}

final class FavouriteProductsLoading extends FavouriteProductsState {}

final class FavouriteProductsSuccess extends FavouriteProductsState {
  final List<DatumFavourite> favouriteProducts;

  FavouriteProductsSuccess({required this.favouriteProducts});
}

final class FavouriteProductsFailure extends FavouriteProductsState {
final String errMessage;
  FavouriteProductsFailure(this.errMessage);
}
