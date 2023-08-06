import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles/app_border_radius.dart';
import '../../../../../core/utils/styles/app_colors.dart';
import '../../../../../core/utils/styles/app_styles_text.dart';
import '../../../view-model/navigationbar_cubit.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, state) {
        var cubitData = BlocProvider.of<NavigationBarCubit>(context);
        return NavigationBarTheme(
          data: const NavigationBarThemeData(
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                AppBorderRadius.circular10,
              ),
            ),
            height: 70,
            surfaceTintColor: AppColors.blueMedium,
            backgroundColor: AppColors.blueMedium,
            labelTextStyle: MaterialStatePropertyAll(AppTextStyles.text12Bold),
          ),
          child: NavigationBar(
            selectedIndex: state,
            onDestinationSelected: (value) {
              cubitData.selectPage(value);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: state == 0
                      ? AppColors.blueMedium
                      : AppColors.primaryColor,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: state == 1
                      ? AppColors.blueMedium
                      : AppColors.primaryColor,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
