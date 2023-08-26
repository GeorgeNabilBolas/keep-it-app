// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../../core/utils/styles/app_images.dart';
import '../../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../model/home_model.dart';

import '../dialog_widgets/dialog_image.dart';
import '../dialog_widgets/dialog_main_icon.dart';
import '../dialog_widgets/dialog_subtitle.dart';
import '../dialog_widgets/dialog_title.dart';
import 'listTile_dialog_button.dart';

class ListTileDialog extends StatelessWidget {
  const ListTileDialog({
    super.key,
    required this.homeModel,
  });

  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: AppDecorations.homeDialog,
            margin: AppPaddings.homeDialogMargin,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DialogTitle(title: homeModel.title),
                  DialogSubTitle(subTitle: homeModel.dialogSubTitle),
                  DialogImage(image: homeModel.dialogImage),
                  ListTileDialogButton(id: homeModel.id),
                ],
              ),
            ),
          ),
          const DialogMainIcon(image: AppImages.homeDialogMainImage),
        ],
      ),
    );
  }
}
