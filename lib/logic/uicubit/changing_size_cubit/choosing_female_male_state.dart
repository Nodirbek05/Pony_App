part of 'choosing_female_male_cubit.dart';

@immutable
abstract class ChoosingFemaleMaleState {}

class ChoosingFemaleMaleInitial extends ChoosingFemaleMaleState {}

class ChoosingFemaleMaleLoading extends ChoosingFemaleMaleState {}

class ChoosingFemaleMaleLoaded extends ChoosingFemaleMaleState {}

class ChoosingFemaleMaleError extends ChoosingFemaleMaleState {
  final String error;

  ChoosingFemaleMaleError(this.error);
}
