import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles/app_colors.dart';

class ListTileNavigateIcon extends StatelessWidget {
  const ListTileNavigateIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const ColoredBox(
        color: AppColors.primaryColor,
        child: Icon(
          size: 30,
          Icons.navigate_next,
          color: AppColors.blueMedium,
        ),
      ),
    );
  }
}
