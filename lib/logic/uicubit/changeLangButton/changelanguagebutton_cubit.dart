import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ponygold/data/language.dart';
import 'package:ponygold/data/language_data.dart';

part 'changelanguagebutton_state.dart';

class ChangelanguagebuttonCubit extends Cubit<ChangelanguagebuttonState> {
  ChangelanguagebuttonCubit() : super(ChangelanguagebuttonInitial());

  BuildContext? context; 
  bool changeColor1 = true;
  bool changeColor2 = true;
  Language selectedLang = LangData.languageList[0];

 Future<void> selectLanguage(lang) async {
    
    if (selectedLang.langName == "Русский") {
      await context?.setLocale(const Locale('ru', 'RU'));
    } else if (selectedLang.langName == "O'zbekcha") {
      await context?.setLocale(const Locale('uz', 'UZ'));
    }
    emit(ChangelanguagebuttonLoaded());
  }

  void catchContext(BuildContext context){
    this.context = context;
  }

  changingButtonColor1() {
    changeColor1 = !changeColor1;
    emit(ChangelanguagebuttonLoaded());
  }

  changingButtonColor2() {
    changeColor2 = !changeColor2;
    emit(ChangelanguagebuttonLoaded());
  }
}
