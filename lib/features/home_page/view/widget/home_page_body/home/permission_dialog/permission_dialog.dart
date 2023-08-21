import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_images.dart';
import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/features/home_page/view/widget/home_page_body/home/permission_dialog/permission_dialog_tiles.dart';

import '../../../../../../../core/utils/styles/app_decorations.dart';
import '../dialog_widgets/dialog_image.dart';
import '../dialog_widgets/dialog_main_icon.dart';
import '../dialog_widgets/dialog_subtitle.dart';
import '../dialog_widgets/dialog_title.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: AppDecorations.homeDialog,
            margin: AppPaddings.homeDialogMargin,
            child: const SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DialogTitle(title: AppStrings.dialogPermissionsTitle),
                  DialogSubTitle(
                      subTitle: AppStrings.dialogPermissionsSubTitle),
                  DialogImage(image: AppImages.permissionDialogContentImage),
                  PermissionDialogTiles()
                ],
              ),
            ),
          ),
          const DialogMainIcon(image: AppImages.permissionDialogMainImage),
        ],
      ),
    );
  }
}
