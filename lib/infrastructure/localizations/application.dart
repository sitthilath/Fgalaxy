import 'dart:ui';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguages = [
    LA_LANG,
    EN_LANG,
  ];

  final List<String> supportedLanguagesCodes = [
    "lo", // for lao language
    "en", // english
    // "zh", // chinese
    // "vi", // vietnam
    // "th",// for thai language
  ];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));
  //function to be invoked when changing the language
  LocaleChangeCallback? onLocaleChanged;
}

Application application = Application();

typedef LocaleChangeCallback = void Function(Locale locale);
