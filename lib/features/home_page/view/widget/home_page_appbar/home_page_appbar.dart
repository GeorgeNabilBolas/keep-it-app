import 'package:flutter/material.dart';

import '../../../../../core/utils/methods/system_ui_overlay_style.dart';
import '../../../../../core/utils/styles/app_colors.dart';
import '../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../core/utils/styles/app_dimension.dart';
import 'home_appbar_title.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.blueMedium,
      title: const HomeAppBarTitle(),
      toolbarHeight: AppDimension.homePageAppBarHeight,
      systemOverlayStyle: systemUiOverlayStyle(AppColors.blueMedium),
      shape: AppDecorations.homePageAppBar,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppDimension.homePageAppBarHeight);
}
