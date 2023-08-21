import 'package:flutter/material.dart';

import '../../../core/utils/methods/system_ui_overlay_style.dart';
import '../../../core/utils/styles/app_colors.dart';
import 'widget/splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    systemUiOverlayStyle(AppColors.primaryColor);
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}
