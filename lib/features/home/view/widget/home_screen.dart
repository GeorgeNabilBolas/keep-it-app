import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view-model/navigationbar_cubit.dart';
import 'home_appbar/home_appbar.dart';
import 'home_body/home_body.dart';
import 'home_bottom_navigationbar/home_bottom_navigationbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBarCubit>(
      create: (context) => NavigationBarCubit(),
      child: const Scaffold(
        bottomNavigationBar: HomeBottomNavigationBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HomeAppBarBody(),
            Spacer(),
            HomeBody(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
