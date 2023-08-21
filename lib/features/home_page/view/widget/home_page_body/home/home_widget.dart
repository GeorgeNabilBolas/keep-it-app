import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../core/utils/styles/app_dimension.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../../core/utils/styles/app_styles_text.dart';
import '../../../../model/home_model.dart';
import '../../../../view-model/is_permissions_allowed_cubit.dart';
import 'listTile_dialog/listTile_dialog.dart';
import 'listTile_dialog/listTile_icon.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.homeModel,
  });
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    final myCubit = BlocProvider.of<IsFeatureWorkCubit>(context);
    return ListTile(
      minVerticalPadding: AppDimension.homeListTileMinVerticalPadding,
      minLeadingWidth: AppDimension.homeListTileMinLeadingWidth,
      title: Text(homeModel.title),
      subtitle: Text(homeModel.listTileSubTitle),
      leading: SvgPicture.asset(
        homeModel.listTileImage,
        height: AppDimension.homeListTileMinLeadingWidth,
      ),
      trailing: BlocBuilder<IsFeatureWorkCubit, bool>(
        builder: (context, state) {
          myCubit.getFeature(homeModel.title);
          return ListTileIcon(isPermissionAllowed: state);
        },
      ),
      textColor: AppColors.primaryColor,
      iconColor: AppColors.primaryColor,
      tileColor: AppColors.blueMedium,
      titleTextStyle: AppTextStyles.text22,
      contentPadding: AppPaddings.homeListTileContentPadding,
      shape: AppDecorations.homeListTile,
      onTap: () => onTap(context, myCubit),
    );
  }

  void onTap(BuildContext context, IsFeatureWorkCubit myCubit) {
    showDialog(
      context: context,
      builder: (context) {
        return ListTileDialog(homeModel: homeModel, cubit: myCubit);
      },
    );
  }
}
