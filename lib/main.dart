import 'package:flutter/material.dart';

import 'constants.dart';
import 'features/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Color(0xFF0B1320),
              fontFamily: 'IntroRust',
              fontSize: MediaQuery.textScaleFactorOf(context) * 50),
          titleSmall: TextStyle(
              color: Color(0xFF0B1320),
              fontFamily: 'IntroRust',
              fontSize: MediaQuery.textScaleFactorOf(context) * 15),
        ),
      ),
      home: const SplashView(),
    );
  }
}
