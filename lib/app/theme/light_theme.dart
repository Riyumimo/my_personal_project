import 'package:flutter/material.dart';
import 'package:my_personal_project/app/theme/checkbox_theme.dart';

import '../../constant.dart';
import 'button_theme.dart';
import 'input_decoration_theme.dart';
import 'theme_data.dart';


ThemeData lightTheme(BuildContext context) {
  var appBarLightTheme;
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: "Plus Jakarta",
    primarySwatch: primaryMaterialColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: blackColor),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: blackColor40),
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    textButtonTheme: textButtonThemeData,
    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme: checkboxThemeData.copyWith(
      side: const BorderSide(color: blackColor40),
    ),
    appBarTheme: appBarLightTheme,
    scrollbarTheme: scrollbarThemeData,
    dataTableTheme: dataTableLightThemeData,
    
  );
}