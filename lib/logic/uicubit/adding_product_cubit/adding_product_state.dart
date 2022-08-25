part of 'adding_product_cubit.dart';

@immutable
abstract class AddingProductState {}

class AddingProductInitial extends AddingProductState {}

class AddingProductLoading extends AddingProductState {}

class AddingProductLoaded extends AddingProductState {
  final List<SingleProductData> productList;
  AddingProductLoaded({required this.productList});
}

class AddingProductError extends AddingProductState {
  final Failure failure;
  AddingProductError({required this.failure});
}
