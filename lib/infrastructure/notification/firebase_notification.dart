import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:galaxy_18_lottery_app/infrastructure/notification/notification_service.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/utils/messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print(
        '${Messaging.APP_NAME} >>> \\un-used\\ Handling a background message: ${message.messageId}');
  }
}

late AndroidNotificationChannel channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class FirebaseNotification extends NotificationService {
  String? currentOpenedMessageId;
  BuildContext? _buildContext;

  @override
  set context(BuildContext context) {
    _buildContext = context;
  }

  @override
  Future<void> initialise() async {
    if (Platform.isIOS) {}
    FirebaseMessaging.instance.requestPermission();
    String topic = 'NotificationTopicTest';
    if (topic != null) {
      FirebaseMessaging.instance.subscribeToTopic(topic);
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      channel = const AndroidNotificationChannel(
        'high_importance_channel_${Messaging.APP_CHANNEL_ID}',
        '${Messaging.APP_NAME} - High Importance Notifications',
        importance: Importance.high,
        description: 'This channel is used for important notifications.',
      );
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      await flutterLocalNotificationsPlugin!
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
        if (message != null) {
          if (currentOpenedMessageId != message.messageId) {
            currentOpenedMessageId = message.messageId!;
            _handleNotificationNavigators(message);
          }
        }
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _showNotification(message);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (currentOpenedMessageId != message.messageId) {
          currentOpenedMessageId = message.messageId!;
          _handleNotificationNavigators(message);
        }
      });
    }
  }

  @override
  Future<void> unsubscribeUserNotificationTopic() async {
    String topic = 'NotificationTopicTest';
    if (topic != null) {
      FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    }
  }

  void _handleNotificationNavigators(RemoteMessage message) {
    try {
      if (_buildContext == null) {
        print("handleNotificationNavigators#error: context is null");
        return;
      }
      print("Cliccckkk");
      AutoRouter.of(_buildContext!).push(RegisterRoute());
    } catch (ex) {
      print("handleNotificationNavigators#error: $ex");
    }
  }

  void _showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;
    print("===>$notification, ======>$androidNotification");
    if (notification != null && androidNotification != null) {
      flutterLocalNotificationsPlugin?.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(<String, dynamic>{'message_id': message.messageId}),
      );
    }
  }
}
