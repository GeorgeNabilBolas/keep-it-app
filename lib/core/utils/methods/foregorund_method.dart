import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';

void startCallback() {
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}

void initForegroundTask() {
  FlutterForegroundTask.init(
    androidNotificationOptions: AndroidNotificationOptions(
      id: 500,
      channelId: 'notification_channel_id',
      channelName: 'App Notifications',
      channelDescription:
          'This notification appears when app features are running.',
      channelImportance: NotificationChannelImportance.LOW,
      priority: NotificationPriority.LOW,
      iconData: const NotificationIconData(
        resType: ResourceType.mipmap,
        resPrefix: ResourcePrefix.ic,
        name: 'launcher',
      ),
    ),
    iosNotificationOptions: const IOSNotificationOptions(
      showNotification: true,
      playSound: false,
    ),
    foregroundTaskOptions: const ForegroundTaskOptions(
      interval: 250,
      isOnceEvent: false,
      autoRunOnBoot: true,
      allowWakeLock: true,
      allowWifiLock: true,
    ),
  );
}

Future<bool> stopForegroundTask() async {
  return await FlutterForegroundTask.stopService();
}

Future<bool> startForegroundTask() async {
  return await FlutterForegroundTask.startService(
    notificationTitle: 'Foreground Service is running',
    notificationText: 'Tap to return to the app',
    callback: startCallback,
  );
}

class MyTaskHandler implements TaskHandler {
  dynamic title;
  //don't use sendPort without implements recivePort
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    title = await FlutterForegroundTask.getData(key: 'title');
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    title = await FlutterForegroundTask.getData(key: 'title');

    FlutterForegroundTask.updateService(
      notificationTitle: '$title',
      notificationText:
          'your allowed features will continue to work even if you close the app',
    );
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {}

  @override
  void onNotificationButtonPressed(String id) {}

  @override
  void onNotificationPressed() => FlutterForegroundTask.launchApp("home");
}
