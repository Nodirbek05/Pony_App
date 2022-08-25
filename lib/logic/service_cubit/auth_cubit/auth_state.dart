part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthChecking extends AuthState {
  AuthChecking();
}


class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
