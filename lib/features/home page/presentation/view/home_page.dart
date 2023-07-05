import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Page',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
