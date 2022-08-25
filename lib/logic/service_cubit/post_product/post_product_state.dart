part of 'post_product_cubit.dart';

@immutable
abstract class PostProductState {}

class PostProductInitial extends PostProductState {}

class PostProductLoading extends PostProductState {}

class PostProductLoaded extends PostProductState {}

class PostProductFailure extends PostProductState {
  final String error;

  PostProductFailure({required this.error});
}
