part of 'single_product_info_cubit.dart';

abstract class SingleProductInfoState {}

class SingleProductInfoInitial extends SingleProductInfoState {}

class SingleProductInfoError extends SingleProductInfoState {
  final Failure failure;
  SingleProductInfoError({required this.failure});
}

class SingleProductInfoLoading extends SingleProductInfoState {}

class SingleProductInfoLoaded extends SingleProductInfoState {
  final List<SingleProductData> productModel;
  SingleProductInfoLoaded({required this.productModel});
}
