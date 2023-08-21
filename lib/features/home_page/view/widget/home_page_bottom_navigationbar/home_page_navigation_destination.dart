import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles/app_colors.dart';
import '../../../model/home_page_navigation_destination_model.dart';
import '../../../view-model/navigationbar_cubit.dart';

class HomePageNavigationDestination extends StatelessWidget {
  const HomePageNavigationDestination(
    this.destinationModel, {
    super.key,
  });
  final HomePageNavigationDestinationModel destinationModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, state) {
        return NavigationDestination(
          icon: Icon(
            destinationModel.icon,
            color: state == destinationModel.index
                ? AppColors.blueMedium
                : AppColors.primaryColor,
          ),
          label: destinationModel.label,
        );
      },
    );
  }
}
