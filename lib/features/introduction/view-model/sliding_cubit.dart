import 'package:flutter_bloc/flutter_bloc.dart';

import 'sliding_states.dart';

class SlidingCubit extends Cubit<SlidingState> {
  SlidingCubit() : super(SlidingInitial());
  int pageNumber = 0;
  void slidingOrder({required SlidingOrders order, int? value}) {
    switch (order) {
      case SlidingOrders.next:
        emit(SlidingNext());
        break;
      case SlidingOrders.skip:
        emit(SlidingSkip());
        break;
      case SlidingOrders.onPageChanged:
        pageNumber = value!;
        emit(SlidingOnPageChanged());
        break;
      default:
        emit(SlidingInitial());
    }
  }
}

enum SlidingOrders { onPageChanged, skip, next }
