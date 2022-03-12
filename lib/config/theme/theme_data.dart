import 'package:flutter/material.dart';
import 'package:mission_timer/utils/app_colors.dart';




TextTheme _getTextTheme(ThemeData theme) {
  final textTheme = theme.textTheme
      .copyWith(
        bodyText1: TextStyle(fontSize: 14, color: ColorsApp.blackText, height: 22 / 14),
        bodyText2: TextStyle(fontSize: 12, color: ColorsApp.blackText, height: 19 / 12),
        caption: TextStyle(fontSize: 12, color: ColorsApp.gray, height: 19 / 12),
        button: TextStyle(fontSize: 18, color: ColorsApp.white, height: 29 / 18),
        subtitle1:
            TextStyle(fontSize: 16, color: ColorsApp.blackText,  height: 26 / 16),
        subtitle2:
            TextStyle(fontSize: 14, color: ColorsApp.blackText,height: 22 / 14),
        headline6:
            TextStyle(fontSize: 22, color: ColorsApp.blackText,  height: 35 / 22),
      )
      .apply(
          // bodyColor: const Color(0xFF687084),
          // displayColor:  const Color(0xFF687084),
          );
  return textTheme;
}

ThemeData appThemeData(BuildContext context) => ThemeData(
      primaryColor: Colors.blueAccent,
      textTheme: _getTextTheme(Theme.of(context)),
      scaffoldBackgroundColor: ColorsApp.scaffoldColor,
      colorScheme: ColorScheme(
        primary: const Color(0xFF9099B2),
        secondary: const Color(0xffF47B7B),
        background: const Color(0xffF9F9F9),
        error: const Color(0xffd32f2f),
        onSecondary: const Color(0xffffffff),
        onBackground: const Color(0xffffffff),
        brightness: Brightness.light,
        surface: const Color(0xffffffff),
        onSurface: Colors.black,
        onPrimary: Colors.white,
        onError: Colors.white,
      ),
    );
