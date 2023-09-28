import 'package:flutter/cupertino.dart';

abstract class MessageService {
  Future<void> initialMessage(BuildContext context);
  Future<void> messageInfo({required String message, int duration = 3});
  Future<void> messageSuccess({required String message, int duration = 3});
  Future<void> messageError({required String message, int duration = 3});
}