import 'dart:ui';
import 'app_translate_delegate.dart';
import 'application.dart';

class LocaleActions {
  static late AppTranslationsDelegate newLocaleDelegate;

  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  static final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };
  static String label = languagesList[0];

  static void onLocaleChange(Locale locale) {
    newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
  }

  static Future<void> selectLanguage(String language) async {
    onLocaleChange(Locale(languagesMap[language]));
    label = language;
  }
}