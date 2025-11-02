import 'package:flutter/rendering.dart';
import 'package:passman/core/models/app_lang_model.dart';

enum LanguageEnum {
  hi(
    AppLangModel(
      countryName: "India",
      flag: "🇮🇳",
      langName: "Hindi",
      locale: Locale("hi"),
    ),
  ),
  en(
    AppLangModel(
      countryName: "United States",
      flag: "🇺🇸",
      langName: "English",
      locale: Locale("en"),
    ),
  ),
  ru(
    AppLangModel(
      countryName: "Russia",
      flag: "🇷🇺",
      langName: "Russian",
      locale: Locale("ru"),
    ),
  ),
  es(
    AppLangModel(
      countryName: "Spain",
      flag: "🇪🇸",
      langName: "Spanish",
      locale: Locale("es"),
    ),
  ),
  zh(
    AppLangModel(
      countryName: "China",
      flag: "🇨🇳",
      langName: "Chinese",
      locale: Locale("zh"),
    ),
  ),
  bho(
    AppLangModel(
      countryName: "India",
      flag: "🇮🇳",
      langName: "Bhojpuri",
      locale: Locale("bho"),
    ),
  );

  final AppLangModel appLangModel;
  const LanguageEnum(this.appLangModel);
}
