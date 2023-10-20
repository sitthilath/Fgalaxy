import 'package:intl/intl.dart';

countDateTimeFormat(String date) {
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  return dateFormat.parse(date);
}

dFormat(var val){
  String date = DateFormat("dd-MM-yyyy").format(val);
  return date;
}