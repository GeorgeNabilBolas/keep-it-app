import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../view-model/permissions_cubits/battery_optimizations_cubit.dart';
import '../../../../../view-model/permissions_cubits/draw_overlays_cubit.dart';
import '../../../../../view-model/permissions_cubits/notifications_cubit.dart';

class PermissionDialogTilesWidget<cubit extends Cubit<bool>>
    extends StatelessWidget {
  const PermissionDialogTilesWidget({
    super.key,
    required this.onTap,
    required this.title,
  });
  final Future<void> Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<cubit, bool>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            if (state == false) {
              await onTap().then((_) => isAllowAllPermissions(context));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.blueMedium),
              ),
              Icon(
                Icons.check_circle_rounded,
                size: 40,
                color: state ? Colors.green : AppColors.blueSemiMedium,
              )
            ],
          ),
        );
      },
    );
  }

  void isAllowAllPermissions(BuildContext context) {
    var allowDrawOverlays = BlocProvider.of<DrawOverlaysCubit>(context).state;
    var ignoreBatteryOptimizations =
        BlocProvider.of<BatteryOptimizationsCubit>(context).state;
    var allowNotifications = BlocProvider.of<NotificationsCubit>(context).state;
    if (allowDrawOverlays && ignoreBatteryOptimizations && allowNotifications) {
      Navigator.pop(context);
    }
  }
}
