import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manager.dart';
import 'package:tut_app/presentation/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s8,
    )

    // app bar theme


    // button theme


    // text theme


    // input decoration theme (text form field)

  );
}