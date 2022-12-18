import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  // named constructor
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
