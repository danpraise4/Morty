// import 'package:morty/core/firebase/messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../resources/strings.dart';

// class NotificationController {
//   static final _notificationPlugin = FlutterLocalNotificationsPlugin();

//   static final NotificationController instance = NotificationController._();

//   NotificationController._() {
//     init();
//   }

//   init() async {
//     const android = AndroidInitializationSettings('ic_launcher');
//     final iOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestProvisionalPermission: true,
//       requestCriticalPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) {
//         // Trigger Notification
//         triggerNotification(id, title, body, payload);
//       },
//     );

//     final settings = InitializationSettings(android: android, iOS: iOS);

//     _notificationPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (details) {},
//       onDidReceiveBackgroundNotificationResponse:
//           firebaseMessagingBackgroundHandler,
//     );
//   }

//   static void triggerNotification(
//     int id,
//     String? title,
//     String? body,
//     String? payload,
//   ) {
//     _notificationPlugin.show(
//       id,
//       title,
//       body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           androidChannelId,
//           appName,
//         ),
//         iOS: DarwinNotificationDetails(),
//       ),
//     );
//   }
// }
