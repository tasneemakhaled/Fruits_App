part of 'add_products_to_favourites_cubit.dart';

@immutable
sealed class AddProductsToFavouritesState {}

final class AddProductsToFavouritesInitial extends AddProductsToFavouritesState {}

final class AddProductsToFavouritesLoading extends AddProductsToFavouritesState {}
final class AddProductsToFavouritesSuccess extends AddProductsToFavouritesState {}
final class AddProductsToFavouritesFailure extends AddProductsToFavouritesState {
  final String errorMessage;

  AddProductsToFavouritesFailure({required this.errorMessage});
}