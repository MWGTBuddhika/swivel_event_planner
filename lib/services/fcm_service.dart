import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/route/app_router.dart';
class FCMService {
  static final FCMService instance = FCMService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  factory FCMService() => instance;

  FCMService._internal() {
    _initialize();
  }

  Future<bool> requestPermission() async{
    // Request permissions
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted notification permission');
      return true;
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted notification provisional permission');
      return false;
    } else {
      print('User declined or has not accepted notification permission');
      return false;
    }
  }

  void _initialize() async {

    // Initialize local notifications for Android and iOS
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');

    DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) async {
        //handle the notification taps when app is in foreground
        print("Notification tapped: id=${details.id}, payload=${details.payload}");
        //do something
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //notification comes when app is in foreground
      print("Notification received: ${message.notification?.title}");
      if(appRouter.navigatorKey.currentContext!=null){
      //do something
      }
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification tap when the app is opened from a background state
      print("Notification tapped when app is background${message.notification?.title}");
      //do something
    });

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        // Handle notification tap when the app is opened from a killed state
        print("Notification tapped when app is killed${message.notification?.title}");
        //do something
      }
    });
  }

  Future<String> getDeviceToken() async {
    FirebaseMessaging _firebaseMessage = FirebaseMessaging.instance;
    String? deviceToken = await _firebaseMessage.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'wurkmo_channel',
      'WurkMo app Notification Channel',
      channelDescription: 'This Channel is used for WurkMo App Notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    DarwinNotificationDetails(
      sound: 'default', // Ensure the sound is set to 'default'
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000; // Use the current timestamp as the notification ID
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }

  // Handle local notification on iOS
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print("Received local notification: id=$id, title=$title, body=$body, payload=$payload");
  }
}