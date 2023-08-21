import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitialState());

  Future<void> checkNotificationPermission() async {
    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();

    if (notificationPermissionStatus == NotificationPermission.granted) {
      emit(AllowNotificationsState());
    } else if (notificationPermissionStatus != NotificationPermission.granted) {
      emit(PreventNotificationsState());
    }
  }
}
