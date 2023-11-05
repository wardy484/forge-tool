import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/model/server/server.dart';

final notificationManagerProvider = Provider<NotificationManager>((ref) {
  return NotificationManager();
});

class NotificationManager {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationManager()
      : flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initialise() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
            );

    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    final bool? result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    print("Permission granted: $result");
  }

  showDuplicateFirewallRuleNotifaction(Server server) async {
    const darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: false,
    );

    const notificationDetails = NotificationDetails(
      macOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Error',
      "Looks like you're already whitelised on ${server.name}.",
      notificationDetails,
    );
  }

  Future<void> showFirewallRuleInstalledNotification(Server server) async {
    const darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: false,
      interruptionLevel: InterruptionLevel.active,
    );

    const notificationDetails = NotificationDetails(
      macOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Success!',
      "HTTP has been whitelisted for ${server.name}.",
      notificationDetails,
    );
  }

  Future<void> showRateLimitError() async {
    const darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: false,
      interruptionLevel: InterruptionLevel.active,
    );

    const notificationDetails = NotificationDetails(
      macOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Error!',
      "Looks like we hit the forge rate limit, slow down a bit.",
      notificationDetails,
    );
  }
}
