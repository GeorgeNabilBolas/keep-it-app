// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../../../core/utils/styles/app_decorations.dart';
import 'allow_notifications_widget.dart';
import 'battery_Optimizations_widget.dart';
import 'draw_overlays_widget.dart';

class PermissionDialogTiles extends StatelessWidget {
  const PermissionDialogTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(8),
      decoration: AppDecorations.homeDialog.copyWith(color: Colors.white),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawOverlaysWidget(),
          Divider(color: AppColors.blueMedium),
          BatteryOptimizationsWidget(),
          Divider(color: AppColors.blueMedium),
          NotificationsWidget(),
        ],
      ),
    );
  }
}
