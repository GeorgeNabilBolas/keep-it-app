import 'package:flutter/material.dart';

import 'home_page_body/home_page_body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HomePageBody(),
    );
  }
}
