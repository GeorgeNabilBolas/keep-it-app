import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/methods/foregorund_method.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      for (var i = 0; i < 4; i++) {
        await prefs.remove('$i');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterForegroundTask.clearAllData();
    FlutterForegroundTask.stopService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
    );
  }
}
