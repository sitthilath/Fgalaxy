import 'package:intl/intl.dart';

nCompact(var val){
  Intl.defaultLocale = 'lo';
  String number = NumberFormat.compact().format(val);
  return number;
}