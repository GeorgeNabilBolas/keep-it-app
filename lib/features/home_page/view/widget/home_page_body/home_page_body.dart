import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles/app_radius.dart';
import '../../../../../../core/utils/styles/app_colors.dart';
import '../../../view-model/navigationbar_cubit.dart';
import 'home/home.dart';

GlobalKey key = GlobalKey();

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, int>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(AppRadius.circular10),
            child: [
              const Home(),
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: AppColors.blueMedium,
                  child: const Text('')),
            ][state],
          ),
        );
      },
    );
  }
}
