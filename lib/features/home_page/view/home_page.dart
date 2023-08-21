import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/ui/with_foreground_task.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';

import '../../../core/utils/methods/system_ui_overlay_style.dart';
import '../view-model/navigationbar_cubit.dart';
import 'widget/home_page_appbar/home_page_appbar.dart';
import 'widget/home_page_bottom_navigationbar/home_bottom_navigationbar.dart';
import 'widget/home_page_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    systemUiOverlayStyle(AppColors.blueMedium);
    return BlocProvider<NavigationBarCubit>(
      create: (context) => NavigationBarCubit(),
      child: const WithForegroundTask(
        child: Scaffold(
          appBar: HomePageAppBar(),
          bottomNavigationBar: HomePageBottomNavigationBar(),
          body: HomePageScreen(),
        ),
      ),
    );
  }
}
