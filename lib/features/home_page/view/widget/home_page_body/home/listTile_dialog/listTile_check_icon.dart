import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles/app_colors.dart';

class ListTileCheckIcon extends StatelessWidget {
  const ListTileCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: const ColoredBox(
        color: AppColors.primaryColor,
        child: Icon(
          size: 30,
          Icons.check_circle_rounded,
          color: Colors.green,
        ),
      ),
    );
  }
}
