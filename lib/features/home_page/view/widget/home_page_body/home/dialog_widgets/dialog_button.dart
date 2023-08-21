import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles/app_colors.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FilledButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.blueSemiMedium),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
