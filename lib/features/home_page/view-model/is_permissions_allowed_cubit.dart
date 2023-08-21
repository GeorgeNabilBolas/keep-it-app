import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsFeatureWorkCubit extends Cubit<bool> {
  IsFeatureWorkCubit() : super(false);

  Future<void> getFeature(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(prefs.getBool(key) ?? false);
  }
}
