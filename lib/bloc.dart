import 'package:flutter_bloc/flutter_bloc.dart';

class SlidingCubit extends Cubit<SlidingState> {
  SlidingCubit() : super(SlidingInitial());
  int _slidingNum = 0;

  int get slidingNum => _slidingNum;

  set slidingNum(int value) {
    _slidingNum = value;
    print(_slidingNum);
    emit(SlidingSuccess());
  }
}

abstract class SlidingState {}

class SlidingInitial extends SlidingState {}

class SlidingSuccess extends SlidingState {}

class SlidingEnd extends SlidingState {}
