// ignore_for_file: use_build_context_synchronously

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../../core/utils/styles/app_images.dart';
import '../../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../model/home_model.dart';
import '../../../../../view-model/is_permissions_allowed_cubit.dart';
import '../../../../../view-model/permissions_cubits/battery_optimizations_cubit.dart';
import '../../../../../view-model/permissions_cubits/draw_overlays_cubit.dart';
import '../../../../../view-model/permissions_cubits/notifications_cubit.dart';
import '../dialog_widgets/dialog_button.dart';
import '../dialog_widgets/dialog_image.dart';
import '../dialog_widgets/dialog_main_icon.dart';
import '../dialog_widgets/dialog_subtitle.dart';
import '../dialog_widgets/dialog_title.dart';
import '../permission_dialog/permission_dialog.dart';

class ListTileDialog extends StatelessWidget {
  const ListTileDialog({
    super.key,
    required this.homeModel,
    required this.cubit,
  });

  final HomeModel homeModel;
  final IsFeatureWorkCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: AppDecorations.homeDialog,
            margin: AppPaddings.homeDialogMargin,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DialogTitle(title: homeModel.title),
                  DialogSubTitle(subTitle: homeModel.dialogSubTitle),
                  DialogImage(image: homeModel.dialogImage),
                  DialogButton(
                    text: cubit.state
                        ? AppStrings.deactivate
                        : AppStrings.activate,
                    onPressed: () async =>
                        await onPressed(context, key: homeModel.title),
                  ),
                ],
              ),
            ),
          ),
          const DialogMainIcon(image: AppImages.homeDialogMainImage),
        ],
      ),
    );
  }

  Future<void> onPressed(BuildContext context, {required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (await isRequirePermissions) {
      showPermissionDialog(context);
    } else if (prefs.getBool(key) == true) {
      await deactivateFeature(key);
      Navigator.pop(context);
    } else {
      await activateFeature(key);
      Navigator.pop(context);
    }
    int numWorkingFeatures = await countWorkingFeatures();
    if (numWorkingFeatures == 1) {
      await setSingleFeatureTitle();
    } else {
      await setMultipleFeatureTitle();
    }
  }

  Future<void> setMultipleFeatureTitle() async {
    int numWorkingFeatures = await countWorkingFeatures();

    await FlutterForegroundTask.saveData(
        key: 'title', value: '$numWorkingFeatures features activated');
  }

  Future<void> setSingleFeatureTitle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? key;
    for (int i = 0; i < 4; i++) {
      if (prefs.getBool(AppStrings.homeTitle[i]) == true) {
        key = AppStrings.homeTitle[i];
      }
    }
    await FlutterForegroundTask.saveData(
        key: 'title', value: '$key feature activated');
  }

  Future<void> activateFeature(String key) async {
    int numWorkingFeatures = await countWorkingFeatures();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (numWorkingFeatures >= 1) {
      await prefs.setBool(key, true);
      await cubit.getFeature(key);
    } else {
      await prefs.setBool(key, true);

      _initForegroundTask();

      await _startForegroundTask();
      await cubit.getFeature(key);
    }
  }

  Future<void> deactivateFeature(String key) async {
    int numWorkingFeatures = await countWorkingFeatures();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (numWorkingFeatures > 1) {
      await prefs.remove(key);
      await cubit.getFeature(key);
    } else {
      await prefs.remove(key);
      await _stopForegroundTask();
      await cubit.getFeature(key);
    }
  }

  void showPermissionDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  DrawOverlaysCubit()..checkCanDrawOverlaysPermission(),
            ),
            BlocProvider(
              create: (context) => BatteryOptimizationsCubit()
                ..checkBatteryOptimizationsPermission(),
            ),
            BlocProvider(
              create: (context) =>
                  NotificationsCubit()..checkNotificationPermission(),
            ),
          ],
          child: const PermissionDialog(),
        );
      },
    );
  }

  get isRequirePermissions async {
    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();

    return (!await FlutterForegroundTask.canDrawOverlays) ||
        (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) ||
        (notificationPermissionStatus != NotificationPermission.granted);
  }

  void _initForegroundTask() {
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
        interval: 500,
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  Future<bool> _stopForegroundTask() async {
    return await FlutterForegroundTask.stopService();
  }

  Future<bool> _startForegroundTask() async {
    if (await FlutterForegroundTask.isRunningService) {
      return await FlutterForegroundTask.updateService();
    } else {
      return await FlutterForegroundTask.startService(
        notificationTitle: 'Foreground Service is running',
        notificationText: 'Tap to return to the app',
        callback: startCallback,
      );
    }
  }

  Future<int> countWorkingFeatures() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = 0;
    for (int i = 0; i < 4; i++) {
      if (prefs.getBool(AppStrings.homeTitle[i]) == true) {
        count++;
      }
    }
    return count;
  }
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

void startCallback() {
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}
