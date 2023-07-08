import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';
import 'package:keep_it/constants.dart';
import 'package:keep_it/core/utils/styles.dart';

class IntroSlidingButtonWidget extends StatelessWidget {
  const IntroSlidingButtonWidget({
    super.key,
    required this.isSkip,
  });
  final bool isSkip;
  @override
  Widget build(BuildContext context) {
    if (isSkip) {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<SlidingCubit>(context).slidingNum =
              kNumberOfPages - 1;
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 25, top: 5, right: 15, bottom: 5),
          decoration: const BoxDecoration(
              color: kColor1,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Text(
            'Skip',
            style: Styles.labelMedium
                .copyWith(color: kColor2, fontWeight: FontWeight.normal),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(left: 15, top: 5, right: 25, bottom: 5),
        decoration: const BoxDecoration(
            color: kColor2,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
        child: Text(
          'next',
          style: Styles.labelMedium.copyWith(fontWeight: FontWeight.normal),
        ),
      );
    }
  }
}
