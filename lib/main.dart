import 'package:flutter/material.dart';
import 'package:keep_it/features/home%20page/presentation/view/home_page.dart';

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
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: kTextColor,
              fontFamily: kFontFamily,
              fontSize: MediaQuery.of(context).size.width * .12),
          labelSmall: TextStyle(
              color: kTextColor,
              fontFamily: kFontFamily,
              fontSize: MediaQuery.of(context).size.width * .03),
        ),
      ),
      home: const SplashView(),
    );
  }
}
