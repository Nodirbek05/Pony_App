part of 'my_order_cubit.dart';

abstract class MyOrderState {}

class MyOrderInitial extends MyOrderState {}

class MyOrderLoading extends MyOrderState {}

class MyOrderLoaded extends MyOrderState {
  final List<Order> activeOrder;
  final List<Order> finishedOrder;
  MyOrderLoaded({required this.activeOrder, required this.finishedOrder});
}

class MyOrderFailure extends MyOrderState {
  final String error;
  MyOrderFailure(this.error);
}
