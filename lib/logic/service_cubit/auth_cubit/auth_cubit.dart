import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../data/api_repository/api_repository.dart';
import '../../../data/api_service/api_service.dart';

part 'auth_state.dart';

enum IsSmsCode { initial, incorrect, correct }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final Repository apiRepository = ShopRepository(ShopApi());

  Box storageId = Hive.box<int>('userId');

  final TextEditingController _numberController =
      TextEditingController(); // Phone number controller
  final TextEditingController _smsController =
      TextEditingController(); // Sent sms code controller

  bool? _isLogin; // check phone number is registered
  IsSmsCode _isSmsCode = IsSmsCode.initial; // check sms code sent phone
  bool _preIconState = true; // check number input empty or not
  bool _openButton = false; // check phone number fully entered

  bool get isLogin => _isLogin!;
  IsSmsCode get isSmsCode => _isSmsCode;
  bool get preIconState => _preIconState;
  bool get openButton => _openButton;
  TextEditingController get numberController => _numberController;
  TextEditingController get smsController => _smsController;

  void removeIcon(bool value) {
    _preIconState = value;
    emit(AuthInitial());
  }
  void disposeControlle(){
    
    _smsController.dispose();
  }

  void checkButtonState() {
    _numberController.addListener(() {
      if (_numberController.text.length == 9) {
        _openButton = true;
      } else {
        _openButton = false;
      }

      emit(AuthInitial());
    });
  }

  void disposeController() {
    _numberController.dispose();
  }

  void checkingLogin(bool value) {
    _isLogin = value;
  }

  void checkingSmsCode(IsSmsCode value) {
    _isSmsCode = value;
    emit(AuthInitial());
  }

  Future<void> fetchAuth() async {
    emit(AuthChecking());
    try {
      final Map<String, dynamic> authInfo =
          await apiRepository.getAuth(_numberController.text);
      storageId.put('userId', authInfo['user']['id']);
      _smsController.value =
          TextEditingValue(text: authInfo['code'].toString());

      checkingLogin(false);
    } catch (e) {
      print(e.toString());
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> fetchSmsCode() async {
    emit(AuthChecking());
    try {
      final Map<String, dynamic> authInfo = await apiRepository.getSmsCode(
          _smsController.text, storageId.get('userId').toString());
      if (authInfo['status']) {
        checkingSmsCode(IsSmsCode.correct);
      } else {
        checkingSmsCode(IsSmsCode.incorrect);
      }
    } catch (e) {
      print("Eroror smsms$e");
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> fetchUserDelete() async {
    final userId = storageId.get('userId');
    emit(AuthChecking());
    try {
      final Map<String, dynamic> userDeleteInfo =
          await apiRepository.getUserDelete(userId);
      storageId.delete('userId');
      checkingLogin(false);
    } catch (e) {
      print(e.toString());
      emit(AuthFailure(e.toString()));
    }
  }
}
