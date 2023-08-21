import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'battery_optimizations_state.dart';

class BatteryOptimizationsCubit extends Cubit<BatteryOptimizationsState> {
  BatteryOptimizationsCubit() : super(BatteryOptimizationsInitialState());

  Future<void> checkBatteryOptimizationsPermission() async {
    if (await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      emit(AllowBatteryOptimizationsState());
    } else if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      emit(PreventBatteryOptimizationsState());
    }
  }
}
