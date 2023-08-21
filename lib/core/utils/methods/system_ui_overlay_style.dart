import 'package:flutter/services.dart';

systemUiOverlayStyle(Color color) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      systemNavigationBarColor: color,
      systemNavigationBarDividerColor: color,
    ),
  );
}
