// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/home_page/view/widget/home_page_body/home/permission_dialog/permission_dialog_tiles_widget.dart';

import '../../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../view-model/permissions_cubits/battery_optimizations_cubit.dart';
import '../../../../../view-model/permissions_cubits/draw_overlays_cubit.dart';
import '../../../../../view-model/permissions_cubits/notifications_cubit.dart';

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PermissionDialogTilesWidget<DrawOverlaysCubit>(
            title: 'Allow app to run over\nother apps',
            onTap: BlocProvider.of<DrawOverlaysCubit>(context).showDrawOverLays,
          ),
          const Divider(color: AppColors.blueMedium),
          PermissionDialogTilesWidget<BatteryOptimizationsCubit>(
            title: 'Allow app to ignore\nbattery optimizations',
            onTap: BlocProvider.of<BatteryOptimizationsCubit>(context)
                .showBatteryOptimizations,
          ),
          const Divider(color: AppColors.blueMedium),
          PermissionDialogTilesWidget<NotificationsCubit>(
            title: 'Allow app to send you\nnotifications',
            onTap: BlocProvider.of<NotificationsCubit>(context)
                .showAllowNotifications,
          ),
        ],
      ),
    );
  }
}
