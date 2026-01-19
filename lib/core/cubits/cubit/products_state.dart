part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final ProductModel productModel; // إضافة الموديل هنا
  ProductsSuccess(this.productModel);
}

class ProductsFailure extends ProductsState {
  final String errMessage;
  ProductsFailure(this.errMessage);
}
