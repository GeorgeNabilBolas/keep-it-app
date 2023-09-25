import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class DrawOverlaysCubit extends Cubit<bool> {
  DrawOverlaysCubit() : super(false);
  Future<void> checkCanDrawOverlaysPermission() async {
    if (await FlutterForegroundTask.canDrawOverlays) {
      emit(true);
    } else if ((!await FlutterForegroundTask.canDrawOverlays)) {
      emit(false);
    }
  }

  Future<void> showDrawOverLays() async {
    await FlutterForegroundTask.openSystemAlertWindowSettings();
    await checkCanDrawOverlaysPermission();
  }
}

  // Future<void> showDrawOverLays() async {
  //   // await FlutterForegroundTask.openSystemAlertWindowSettings();
  //   await AppSettings.openAppSettings(
  //     type: AppSettingsType.settings,
  //   );
  //   await Timer.periodic(Duration(milliseconds: 1000), (timer) async {
  //     print('object');
  //     await checkCanDrawOverlaysPermission();
  //     await Future.delayed(Duration(milliseconds: 500));
  //     if (await FlutterForegroundTask.isAppOnForeground) {
  //       timer.cancel();
  //     }
  //   });
  // }