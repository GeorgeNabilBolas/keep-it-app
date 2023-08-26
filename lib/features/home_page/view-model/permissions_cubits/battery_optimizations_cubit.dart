import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class BatteryOptimizationsCubit extends Cubit<bool> {
  BatteryOptimizationsCubit() : super(false);

  Future<void> checkBatteryOptimizationsPermission() async {
    if (await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      emit(true);
    } else if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      emit(false);
    }
  }

  Future<void> showBatteryOptimizations() async {
    await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    await checkBatteryOptimizationsPermission();
  }
}
