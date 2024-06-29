import 'package:flutter/material.dart';
import 'package:warrior_app/utils/theme/app_theme.dart';
import 'package:warrior_app/views/warriors_view/warriors_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const WarriorsView());
  }
}
