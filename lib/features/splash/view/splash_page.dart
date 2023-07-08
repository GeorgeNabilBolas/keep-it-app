import 'package:flutter/material.dart';

import 'widget/splash_view_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewScreen(),
    );
  }
}