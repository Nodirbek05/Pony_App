part of 'changing_and_choosing_size_cubit.dart';

@immutable
abstract class ChangingAndChoosingSizeState {}

class ChangingAndChoosingSizeInitial extends ChangingAndChoosingSizeState {}

class ChangingAndChoosingSizeLoading extends ChangingAndChoosingSizeState {}

class ChangingAndChoosingSizeFailure extends ChangingAndChoosingSizeState {
  final String error;

  ChangingAndChoosingSizeFailure(this.error);
}
class ChangingAndChoosingSizeLoaded extends ChangingAndChoosingSizeState{}
