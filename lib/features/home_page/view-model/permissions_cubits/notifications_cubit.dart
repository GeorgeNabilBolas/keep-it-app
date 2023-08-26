import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class NotificationsCubit extends Cubit<bool> {
  NotificationsCubit() : super(false);

  Future<void> checkNotificationPermission() async {
    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();

    if (notificationPermissionStatus == NotificationPermission.granted) {
      emit(true);
    } else if (notificationPermissionStatus != NotificationPermission.granted) {
      emit(false);
    }
  }

  Future<void> showAllowNotifications() async {
    await FlutterForegroundTask.requestNotificationPermission();
    await checkNotificationPermission();
  }
}
