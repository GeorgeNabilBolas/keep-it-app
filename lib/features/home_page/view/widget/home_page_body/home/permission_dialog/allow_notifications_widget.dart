// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../view-model/permissions_cubits/notifications_cubit.dart';
import '../../../../../view-model/permissions_cubits/notifications_state.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        Color color = AppColors.blueSemiMedium;
        color = changeColor(state, color);
        return GestureDetector(
          onTap: () async => await onTap(state, context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Allow app to send you\nnotifications',
                style: TextStyle(color: AppColors.blueMedium),
              ),
              Icon(
                Icons.check_circle_rounded,
                size: 40,
                color: color,
              )
            ],
          ),
        );
      },
    );
  }

  Color changeColor(NotificationsState state, Color color) {
    if (state is AllowNotificationsState) {
      color = Colors.green;
    } else if (state is PreventNotificationsState) {
      color = AppColors.blueSemiMedium;
    }
    return color;
  }

  Future<void> onTap(NotificationsState state, BuildContext context) async {
    {
      if (state is PreventNotificationsState) {
        await FlutterForegroundTask.requestNotificationPermission();
        await BlocProvider.of<NotificationsCubit>(context)
            .checkNotificationPermission();
      }
    }
  }
}
