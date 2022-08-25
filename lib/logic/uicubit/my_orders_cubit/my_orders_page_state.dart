part of 'my_orders_page_cubit.dart';

abstract class MyOrdersPageState {}

class MyOrdersPageInitial extends MyOrdersPageState {}

class MyOrdersPageLoading extends MyOrdersPageState {}

class MyOrdersPageLoaded extends MyOrdersPageState {}

class MyOrdersPageError extends MyOrdersPageState {
  final String error;

  MyOrdersPageError(this.error);
}
