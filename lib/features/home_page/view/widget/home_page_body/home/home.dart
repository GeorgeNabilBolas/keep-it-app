import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles/app_images.dart';
import '../../../../../../core/utils/styles/app_info.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../../core/utils/styles/app_strings.dart';
import '../../../../model/home_model.dart';
import '../../../../view-model/is_permissions_allowed_cubit.dart';
import 'home_widget.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AppInfo.numberOfHomeListTiles,
      itemBuilder: (context, index) {
        return Padding(
          padding: contentSpacing(index),
          child: Material(
            child: BlocProvider(
              create: (context) => IsFeatureWorkCubit(),
              child: HomeWidget(
                homeModel: HomeModel(
                  title: AppStrings.homeTitle[index],
                  listTileSubTitle: AppStrings.homeListTileSubtitle[index],
                  listTileImage: AppImages.homeListTileImage[index],
                  dialogImage: AppImages.homeDialogContentImage[index],
                  dialogSubTitle: AppStrings.homeDialogSubtitle[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  EdgeInsets contentSpacing(int index) {
    return index == AppInfo.numberOfHomeListTiles - 1
        ? AppPaddings.homePageContentSpacing.copyWith(bottom: 0)
        : AppPaddings.homePageContentSpacing;
  }
}
