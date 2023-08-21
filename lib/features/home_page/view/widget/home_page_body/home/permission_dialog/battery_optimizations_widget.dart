// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../view-model/permissions_cubits/battery_optimizations_cubit.dart';
import '../../../../../view-model/permissions_cubits/battery_optimizations_state.dart';

class BatteryOptimizationsWidget extends StatelessWidget {
  const BatteryOptimizationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BatteryOptimizationsCubit, BatteryOptimizationsState>(
      builder: (context, state) {
        Color color = AppColors.blueSemiMedium;
        color = changeColor(state, color);
        return GestureDetector(
          onTap: () async => await onTap(state, context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Prevent battery optimization\nfor this app',
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

  Color changeColor(BatteryOptimizationsState state, Color color) {
    if (state is AllowBatteryOptimizationsState) {
      color = Colors.green;
    } else if (state is PreventBatteryOptimizationsState) {
      color = AppColors.blueSemiMedium;
    }
    return color;
  }

  Future<void> onTap(
      BatteryOptimizationsState state, BuildContext context) async {
    {
      if (state is PreventBatteryOptimizationsState) {
        await FlutterForegroundTask.requestIgnoreBatteryOptimization();
        await BlocProvider.of<BatteryOptimizationsCubit>(context)
            .checkBatteryOptimizationsPermission();
      }
    }
  }
}
