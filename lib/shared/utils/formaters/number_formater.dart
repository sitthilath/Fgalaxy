import 'package:intl/intl.dart';

nCompact(var val){
  Intl.defaultLocale = 'lo';
  String number = NumberFormat.compact().format(val);
  return number;
}
nFormat(var val){
  Intl.defaultLocale = 'lo';
  String number = NumberFormat("###,###.##").format(val);
  return number;
}