import 'dart:ui';

class AppLangModel {
  final String langName;
  final String flag;
  final Locale locale;
  final String countryName;

  const AppLangModel({
    required this.countryName,
    required this.flag,
    required this.langName,
    required this.locale,
  });
}
