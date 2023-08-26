import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:keep_it/features/home_page/view-model/home_feature_cubits/selected_feature_cubit.dart';
import 'package:keep_it/features/home_page/view-model/permissions_cubits/battery_optimizations_cubit.dart';
import 'package:keep_it/features/home_page/view-model/permissions_cubits/draw_overlays_cubit.dart';
import 'package:keep_it/features/home_page/view-model/permissions_cubits/notifications_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/methods/foregorund_method.dart';
import '../../../../core/utils/styles/app_strings.dart';
import '../../view/widget/home_page_body/home/permission_dialog/permission_dialog.dart';

abstract class GenerateFeatureState {}

class GenerateFeatureInitState extends GenerateFeatureState {}

class IsRequirePermissionState extends GenerateFeatureState {
  Future<void> showPermissionDialog(BuildContext context) async {
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
}

class IsNotRequirePermissionState extends GenerateFeatureState {
  Future<int> get _countWorkingFeatures async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = 0;
    for (int i = 0; i < 4; i++) {
      if (prefs.getBool(i.toString()) == true) {
        count++;
      }
    }
    return count;
  }

  Future<String> get _workingFeatureTitle async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String key = '';
    for (int i = 0; i < 4; i++) {
      if (prefs.getBool(i.toString()) == true) {
        key = AppStrings.homeTitle[i];
      }
    }
    return key;
  }

////////////////////////////////////////////////////////////////
  Future<void> setFeatureActivation(
      String featureId, SelectedFeatureCubit cubit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(featureId) == true) {
      await _setDeactivateFeature(featureId);
    } else {
      await _checkFeatureFunctionality(featureId);
      await _setFeatureFunctionality(featureId, cubit);
      await _setActivateFeature(featureId);
    }
    await cubit.updateFeatureState(featureId);
    await _setFeatureTitle();
  }

  Future<void> _checkFeatureFunctionality(String featureId) async {
    switch (featureId) {
      case '0':
        var battery = Battery();
        if (await battery.batteryState == BatteryState.discharging) {
          break;
        }

        break;
      case '1':
        break;
      case '2':
        break;
      case '3':
        break;
      default:
    }
  }

  Future<void> _setFeatureFunctionality(
      String featureId, SelectedFeatureCubit cubit) async {
    switch (featureId) {
      case '0':
        var battery = Battery();
        var detectBatteryState = battery.onBatteryStateChanged.listen((_) {});
        detectBatteryState.onData((data) async {
          if (data == BatteryState.discharging) {
            print(data);
            await _setDeactivateFeature('0');
            await cubit.updateFeatureState('0');
            await _setFeatureTitle();
            detectBatteryState.cancel();
          }
        });

        break;
      case '1':
        break;
      case '2':
        break;
      case '3':
        break;
      default:
    }
  }

  Future<void> _setActivateFeature(String featureId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(featureId, true);

    if (await _countWorkingFeatures == 1) {
      initForegroundTask();
      await startForegroundTask();
    }
  }

  Future<void> _setDeactivateFeature(String featureId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(featureId);
    if (await _countWorkingFeatures == 0) {
      await stopForegroundTask();
    }
  }

////////////////////////////////////////////////////////////////
  Future<void> _setFeatureTitle() async {
    if (await _countWorkingFeatures == 1) {
      await _setSingleFeatureTitle();
    } else {
      await _setMultipleFeatureTitle();
    }
  }

  Future<void> _setMultipleFeatureTitle() async {
    await FlutterForegroundTask.saveData(
        key: 'title',
        value: '${await _countWorkingFeatures} features activated');
  }

  Future<void> _setSingleFeatureTitle() async {
    await FlutterForegroundTask.saveData(
        key: 'title', value: '${await _workingFeatureTitle} feature activated');
  }
}
