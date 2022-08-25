part of 'changelanguagebutton_cubit.dart';

@immutable
abstract class ChangelanguagebuttonState {}

class ChangelanguagebuttonInitial extends ChangelanguagebuttonState {}

class ChangelanguagebuttonLoading extends ChangelanguagebuttonState {}

class ChangelanguagebuttonLoaded extends ChangelanguagebuttonState {}

class ChangelanguagebuttonFailure extends ChangelanguagebuttonState {
  final String error;

  ChangelanguagebuttonFailure(this.error);
}
