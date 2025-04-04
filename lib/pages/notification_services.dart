import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationServices {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init () async {
    tz.initializeTimeZones();

    const iOSSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(
      iOS: iOSSettings,
    );
    await _notifications.initialize(settings);
  }
  static Future<void> scheduleNotification(
    DateTime dateTime, String taskTitle) async {

    const iOSDetails = DarwinNotificationDetails();

    const platformDetails = NotificationDetails(
      iOS: iOSDetails,
    );

    await _notifications.zonedSchedule(
      DateTime.now().millisecondsSinceEpoch ~/1000,
      'Reminder',
      taskTitle,
      tz.TZDateTime.from(dateTime, tz.local),
      platformDetails,
      uiLocalNotificationDateInterpretation: 
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );


  }
}

