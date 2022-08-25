part of 'post_authentication_cubit.dart';

@immutable
abstract class PostAuthenticationState {}

class PostAuthenticationInitial extends PostAuthenticationState {}

class PostAuthenticationLoading extends PostAuthenticationState {}

class PostAuthenticationLoaded extends PostAuthenticationState {}

class PostAuthenticationError extends PostAuthenticationState {
  final String error;
  PostAuthenticationError(this.error);
}
