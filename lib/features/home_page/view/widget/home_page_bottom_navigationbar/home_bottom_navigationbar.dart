import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/core/utils/styles/app_dimension.dart';

import '../../../../../core/utils/styles/app_radius.dart';
import '../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../core/utils/styles/app_styles_text.dart';
import '../../../model/home_page_navigation_destination_model.dart';
import '../../../view-model/navigationbar_cubit.dart';
import 'home_page_navigation_destination.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  const HomePageBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, state) {
        var cubitData = BlocProvider.of<NavigationBarCubit>(context);
        return NavigationBarTheme(
          data: navigationBarThemeData(),
          child: NavigationBar(
            selectedIndex: state,
            onDestinationSelected: (value) => cubitData.selectPage(value),
            destinations: homePageDestinations,
          ),
        );
      },
    );
  }

  List<Widget> get homePageDestinations {
    return const [
      HomePageNavigationDestination(
        HomePageNavigationDestinationModel(
          index: 0,
          icon: Icons.home,
          label: 'Home',
        ),
      ),
      HomePageNavigationDestination(
        HomePageNavigationDestinationModel(
          index: 1,
          icon: Icons.settings,
          label: 'Settings',
        ),
      ),
    ];
  }

  NavigationBarThemeData navigationBarThemeData() {
    return const NavigationBarThemeData(
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          AppRadius.circular10,
        ),
      ),
      height: AppDimension.homePageBottomHeight,
      indicatorColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.blueMedium,
      backgroundColor: AppColors.blueMedium,
      labelTextStyle: MaterialStatePropertyAll(AppTextStyles.text12Bold),
    );
  }
}
