import 'package:bloc/bloc.dart';

part 'choosing_payment_part_state.dart';

class ChoosingPaymentPartCubit extends Cubit<ChoosingPaymentPartState> {
  ChoosingPaymentPartCubit() : super(ChoosingPaymentPartInitial());

  int paymentType = 0;
  void changePaymentType(int payment) {
    paymentType = payment;
    emit(ChoosingPaymentPartLoaded());
  }
}
