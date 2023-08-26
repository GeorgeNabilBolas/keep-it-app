import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'generate_feature_state.dart';

class GenerateFeatureCubit extends Cubit<GenerateFeatureState> {
  GenerateFeatureCubit() : super(GenerateFeatureInitState());

  Future<void> checkPermissions() async {
    if (await _isRequirePermissions) {
      emit(IsRequirePermissionState());
    } else {
      emit(IsNotRequirePermissionState());
    }
  }

  Future<bool> get _isRequirePermissions async {
    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();

    return (!await FlutterForegroundTask.canDrawOverlays) ||
        (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) ||
        (notificationPermissionStatus != NotificationPermission.granted);
  }
}
