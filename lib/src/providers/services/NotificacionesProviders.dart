import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificacionesPushProvider {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;
  static Future _backgroundHandler(RemoteMessage message) async {
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
    if (Platform.isAndroid) {
      _messageStream.add(message.data['data']['mensaje'] ?? 'No data');
    } else {
      _messageStream.add(message.data['mensaje'] ?? 'No data ios');
    }
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
    if (Platform.isAndroid) {
      _messageStream.add(message.data['data']['mensaje'] ?? 'No data');
    } else {
      _messageStream.add(message.data['mensaje'] ?? 'No data ios');
    }
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No data');
    if (Platform.isAndroid) {
      _messageStream.add(message.data['data']['mensaje'] ?? 'No data');
    } else {
      _messageStream.add(message.data['mensaje'] ?? 'No data ios');
    }
  }

  static Future initializeApp() async {
    // Push Notifications

    // ignore: unused_local_variable
    bool kisweb;
    try {
      if (Platform.isIOS) {
        kisweb = false;
        await Firebase.initializeApp();
        NotificationSettings settings = await messaging.requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true);
        await messaging.subscribeToTopic('capital24');
        token = await FirebaseMessaging.instance.getToken();
        print('User push notification status ${settings.authorizationStatus}');
        print('Token: $token');

        // Handlers
        FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
        FirebaseMessaging.onMessage.listen(_onMessageHandler);
        FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
      } else if (Platform.isAndroid) {
        kisweb = false;
        await Firebase.initializeApp();
        NotificationSettings settings = await messaging.requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true);
        await messaging.subscribeToTopic('capital24');
        token = await FirebaseMessaging.instance.getToken();
        print('User push notification status ${settings.authorizationStatus}');
        print('Token: $token');

        // Handlers
        FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
        FirebaseMessaging.onMessage.listen(_onMessageHandler);
        FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
      } else {
        kisweb = true;
      }
    } catch (e) {
      kisweb = true;
    }

    // Local Notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
