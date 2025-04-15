// // notification_service.dart

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> initializeNotifications() async {
//   final InitializationSettings initializationSettings =
//       InitializationSettings(
//           android: AndroidInitializationSettings('app_icon'));

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

// void showNotification() async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//           'your channel id', 'your channel name',
//           importance: Importance.max,
//           priority: Priority.high,
//           showWhen: false);

//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await flutterLocalNotificationsPlugin.show(
//       0, 'Actualización de incendios', 'Los incendios han sido actualizados', platformChannelSpecifics);
// }
