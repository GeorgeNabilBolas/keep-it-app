import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../view-model/permissions_cubits/draw_overlays_cubit.dart';
import '../../../../../view-model/permissions_cubits/draw_overlays_state.dart';

class DrawOverlaysWidget extends StatelessWidget {
  const DrawOverlaysWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawOverlaysCubit, DrawOverlaysState>(
      builder: (context, state) {
        Color color = AppColors.blueSemiMedium;
        color = changeColor(state, color);
        return GestureDetector(
          onTap: () async => await onTap(state, context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Allow access to background\nservices',
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

  Color changeColor(DrawOverlaysState state, Color color) {
    if (state is AllowDrawOverlaysState) {
      color = Colors.green;
    } else if (state is PreventDrawOverlaysState) {
      color = AppColors.blueSemiMedium;
    }
    return color;
  }

  Future<void> onTap(DrawOverlaysState state, BuildContext context) async {
    if (state is PreventDrawOverlaysState) {
      await FlutterForegroundTask.openSystemAlertWindowSettings();
      await BlocProvider.of<DrawOverlaysCubit>(context)
          .checkCanDrawOverlaysPermission();
    }
  }
}
