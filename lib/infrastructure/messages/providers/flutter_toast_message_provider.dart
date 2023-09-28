import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/flutter_toast_message.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/message_service.dart';

final toastMessageProvider = Provider<MessageService>((ref){
  final FlutterToastMessage flutterToastMessage = FlutterToastMessage();
  return flutterToastMessage;
});