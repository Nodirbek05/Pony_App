part of 'choosing_payment_part_cubit.dart';

abstract class ChoosingPaymentPartState {}

class ChoosingPaymentPartInitial extends ChoosingPaymentPartState {}

class ChoosingPaymentPartLoading extends ChoosingPaymentPartState {}

class ChoosingPaymentPartLoaded extends ChoosingPaymentPartState {}

class ChoosingPaymentPartError extends ChoosingPaymentPartState {
  final String error;

  ChoosingPaymentPartError(this.error);
}
