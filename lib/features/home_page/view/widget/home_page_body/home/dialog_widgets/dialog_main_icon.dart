import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class DialogMainIcon extends StatelessWidget {
  const DialogMainIcon({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      child: SvgPicture.asset(
        image,
        height: 60,
      ),
    );
  }
}
