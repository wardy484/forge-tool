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

  Future<void> initialise() async {
    final initializationSettingsDarwin = DarwinInitializationSettings();
    final initializationSettings = InitializationSettings(
      macOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    print("Before asking");

    final plugin =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>();

    if (plugin != null) {
      print(await plugin.pendingNotificationRequests());
      final bool? result = await plugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      print("Permission granted: $result");
      print(await plugin.pendingNotificationRequests());
    } else {
      print("Plugin is null");
    }
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

  Future<void> showUnableToOpenSSHEerror(Server server) async {
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
      "Unable to connect to SSH for: ${server.name}.",
      notificationDetails,
    );
  }

  Future<void> showUnableToOpenBrowserError() async {
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
      "Unable to open default browser.",
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
