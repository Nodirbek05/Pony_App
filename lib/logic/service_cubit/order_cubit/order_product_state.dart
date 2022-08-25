part of 'order_product_cubit.dart';

abstract class OrderProductState {}

class OrderProductInitial extends OrderProductState {}

class OrderProductLoading extends OrderProductState {}

class OrderProductLoaded extends OrderProductState {}

class OrderProductFailure extends OrderProductState {
  final String error;
  OrderProductFailure(this.error);
}
