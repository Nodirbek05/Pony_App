part of 'caruselchange_cubit.dart';

abstract class CaruselchangeState {}

class CaruselchangeInitial extends CaruselchangeState {}

class CaruselchangeLoading extends CaruselchangeState {}

class CaruselchangeLoaded extends CaruselchangeState {}

class CaruselchangeFailure extends CaruselchangeState {
  final String error;

  CaruselchangeFailure(this.error);
}