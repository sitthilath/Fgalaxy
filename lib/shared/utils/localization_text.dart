import 'package:flutter/cupertino.dart';
import 'package:galaxy_18_lottery_app/infrastructure/localizations/app_translate.dart';

class Txt{
  static String t(BuildContext context, String key){
    String t = AppTranslations.of(context)!.text(key);
    return t;
  }
}