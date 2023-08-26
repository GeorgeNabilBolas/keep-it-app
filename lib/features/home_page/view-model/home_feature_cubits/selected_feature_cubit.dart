// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/home_page/model/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/widget/home_page_body/home/listTile_dialog/listTile_dialog.dart';
import 'generate_feature_cubit.dart';

class SelectedFeatureCubit extends Cubit<bool> {
  SelectedFeatureCubit() : super(false);

  Future<void> updateFeatureState(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(prefs.getBool(key) ?? false);
  }

  Future<void> onFeatureTap(BuildContext context, HomeModel homeModel) async {
    showDialog(
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: this),
            BlocProvider(create: (context) => GenerateFeatureCubit())
          ],
          child: ListTileDialog(homeModel: homeModel),
        );
      },
    );
  }
}
