import 'package:flutter/material.dart';

import 'listTile_check_icon.dart';
import 'listTile_navigate_icon.dart';

class ListTileIcon extends StatelessWidget {
  const ListTileIcon({
    super.key,
    required this.isPermissionAllowed,
  });
  final bool isPermissionAllowed;
  @override
  Widget build(BuildContext context) {
    return isPermissionAllowed
        ? const ListTileCheckIcon()
        : const ListTileNavigateIcon();
  }
}
