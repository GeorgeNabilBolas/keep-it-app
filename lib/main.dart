import 'package:flutter/material.dart';
import 'constants.dart';
import 'features/splash/view/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
