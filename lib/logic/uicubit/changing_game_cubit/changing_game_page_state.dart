part of 'changing_game_page_cubit.dart';

@immutable
abstract class ChangingGamePageState {}

class ChangingGamePageInitial extends ChangingGamePageState {}

class ChangingGamePageLoading extends ChangingGamePageState {}

class ChangingGamePageLoaded extends ChangingGamePageState {}

class ChangingGamePageFailure extends ChangingGamePageState {
  final String error;

  ChangingGamePageFailure({required this.error});
}
