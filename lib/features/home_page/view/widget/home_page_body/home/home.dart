import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles/app_images.dart';
import '../../../../../../core/utils/styles/app_info.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../../core/utils/styles/app_strings.dart';
import '../../../../model/home_model.dart';
import '../../../../view-model/home_feature_cubits/selected_feature_cubit.dart';
import 'home_widget.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Padding(padding: AppPaddings.homePageContentSpacing);
      },
      shrinkWrap: true,
      itemCount: AppInfo.numberOfHomeListTiles,
      itemBuilder: (context, index) {
        return Material(
          child: BlocProvider(
            create: (context) => SelectedFeatureCubit(),
            child: HomeWidget(
              homeModel: HomeModel(
                id: index.toString(),
                title: AppStrings.homeTitle[index],
                listTileSubTitle: AppStrings.homeListTileSubtitle[index],
                listTileImage: AppImages.homeListTileImage[index],
                dialogImage: AppImages.homeDialogContentImage[index],
                dialogSubTitle: AppStrings.homeDialogSubtitle[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
