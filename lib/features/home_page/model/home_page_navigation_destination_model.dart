import 'package:flutter/material.dart';

class HomePageNavigationDestinationModel {
  const HomePageNavigationDestinationModel({
    required this.index,
    required this.icon,
    required this.label,
  });
  final int index;
  final IconData icon;
  final String label;
}
