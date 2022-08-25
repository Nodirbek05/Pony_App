import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changing_game_page_state.dart';

class ChangingGamePageCubit extends Cubit<ChangingGamePageState> {
  ChangingGamePageCubit() : super(ChangingGamePageInitial());

  int page = 0;
  void changePage(int indexOfPage) {
    page = indexOfPage;
    emit(ChangingGamePageInitial());
  }
}
