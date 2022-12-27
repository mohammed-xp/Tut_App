import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {

  // named constructor
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
