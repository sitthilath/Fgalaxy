import 'package:flutter/cupertino.dart';

abstract class NotificationService {
  set context(BuildContext context);
  Future<void> initialise();
  Future<void> unsubscribeUserNotificationTopic();
}