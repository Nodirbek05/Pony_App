part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final Failure failure;

  FavoriteFailure(this.failure);
}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteProduct> favoriteProduct;

  FavoriteLoaded(this.favoriteProduct);
}
