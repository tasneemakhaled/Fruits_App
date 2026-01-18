part of 'favourite_products_cubit.dart';

@immutable
sealed class FavouriteProductsState {}

final class FavouriteProductsInitial extends FavouriteProductsState {}
final class FavouriteProductsLoading extends FavouriteProductsState {}
final class FavouriteProductsSuccess extends FavouriteProductsState {}
final class FavouriteProductsFailure extends FavouriteProductsState {}
