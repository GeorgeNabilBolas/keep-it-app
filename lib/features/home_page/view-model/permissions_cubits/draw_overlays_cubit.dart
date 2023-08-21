import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'draw_overlays_state.dart';

class DrawOverlaysCubit extends Cubit<DrawOverlaysState> {
  DrawOverlaysCubit() : super(DrawOverlaysInitialState());
  Future<void> checkCanDrawOverlaysPermission() async {
    if (await FlutterForegroundTask.canDrawOverlays) {
      emit(AllowDrawOverlaysState());
    } else if ((!await FlutterForegroundTask.canDrawOverlays)) {
      emit(PreventDrawOverlaysState());
    }
  }
}
