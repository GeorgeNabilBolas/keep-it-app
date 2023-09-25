import 'dart:isolate';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      interval: 1000,
      isOnceEvent: false,
      autoRunOnBoot: true,
      allowWakeLock: true,
      allowWifiLock: true,
    ),
  );
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
  String? batteryFeature;
  String? motionFeature;
  String? pocketFeature;
  String? headsetFeature;
  var battery = Battery();

  //don't use sendPort without implements recivePort
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    title = await FlutterForegroundTask.getData(key: 'title');
    batteryFeature = await FlutterForegroundTask.getData(key: '0');
    motionFeature = await FlutterForegroundTask.getData(key: '1');
    pocketFeature = await FlutterForegroundTask.getData(key: '2');
    headsetFeature = await FlutterForegroundTask.getData(key: '3');
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    title = await FlutterForegroundTask.getData(key: 'title');
    batteryFeature = await FlutterForegroundTask.getData(key: '0');
    if (batteryFeature != null) {
      await checkBattery();
    }
    motionFeature = await FlutterForegroundTask.getData(key: '1');
    if (motionFeature != null) {
      print('motionFeature');
    }
    pocketFeature = await FlutterForegroundTask.getData(key: '2');
    if (pocketFeature != null) {
      print('pocketFeature');
    }
    headsetFeature = await FlutterForegroundTask.getData(key: '3');
    if (headsetFeature != null) {
      print('headsetFeature');
    }

    FlutterForegroundTask.updateService(
      notificationTitle: '$title',
      notificationText:
          'your allowed features will continue to work even if you close the app',
    );
  }

  Future<void> checkBattery() async {
    if (await battery.batteryState == BatteryState.discharging) {
      FlutterForegroundTask.wakeUpScreen();
      FlutterForegroundTask.launchApp('alert');
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    print('onDestroy done');
  }

  @override
  void onNotificationButtonPressed(String id) {}

  @override
  void onNotificationPressed() => FlutterForegroundTask.launchApp("alert");
}

/////////////////////////////////////////////////////////
