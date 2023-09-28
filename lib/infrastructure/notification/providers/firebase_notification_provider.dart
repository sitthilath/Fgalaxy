import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/infrastructure/notification/firebase_notification.dart';
import 'package:galaxy_18_lottery_app/infrastructure/notification/notification_service.dart';

final firebaseNotificationProvider = Provider<FirebaseNotification>((ref){
  final notificationService = FirebaseNotification();
  return notificationService;
});