import 'package:flutter/material.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({
    super.key,
    this.child,
    this.onEnd,
  });
  final Widget? child;
  final Function()? onEnd;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      onEnd: onEnd,
      child: child,
    );
  }
}
