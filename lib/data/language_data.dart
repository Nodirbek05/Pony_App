import 'package:flutter/material.dart';
import 'package:ponygold/core/constant/app_icons.dart';
import 'package:ponygold/data/language.dart';

class LangData {
  static final List<Language> languageList = [
    Language(
      index: 2,
      langName: "O'zbekcha",
      locale: const Locale('uz', 'UZ'),
    ),
 
    Language(
      index: 1,
      langName: "Русский",
      locale: const Locale('ru', 'RU'),
    ),
  ];
}
