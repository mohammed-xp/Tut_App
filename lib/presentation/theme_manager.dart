import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // cardView theme


    // app bar theme


    // button theme


    // text theme


    // input decoration theme (text form field)

  );
}