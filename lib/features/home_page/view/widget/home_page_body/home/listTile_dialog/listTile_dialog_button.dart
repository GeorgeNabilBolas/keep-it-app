import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/features/home_page/view-model/home_feature_cubits/generate_feature_state.dart';

import '../../../../../view-model/home_feature_cubits/generate_feature_cubit.dart';
import '../../../../../view-model/home_feature_cubits/selected_feature_cubit.dart';
import '../dialog_widgets/dialog_button.dart';

class ListTileDialogButton extends StatelessWidget {
  const ListTileDialogButton({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    SelectedFeatureCubit cubit = BlocProvider.of<SelectedFeatureCubit>(context);
    return BlocListener<GenerateFeatureCubit, GenerateFeatureState>(
      listener: (context, state) async {
        if (state is IsRequirePermissionState) {
          await state.showPermissionDialog(context);
        } else if (state is IsNotRequirePermissionState) {
          Navigator.pop(context);
          await state.setFeatureActivation(id, cubit, context);
        }
      },
      child: DialogButton(
        text: cubit.state ? AppStrings.deactivate : AppStrings.activate,
        onPressed: () async {
          await BlocProvider.of<GenerateFeatureCubit>(context)
              .checkPermissions();
        },
      ),
    );
  }
}
