import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';

TextTheme _getTextTheme(ThemeData theme) {
  final textTheme = theme.textTheme
      .copyWith(
        bodyText1: TextStyle(fontSize: 14, color: ColorsApp.blackText),
        bodyText2: TextStyle(fontSize: 12, color: ColorsApp.blackText),
        caption: TextStyle(fontSize: 12, color: ColorsApp.gray),
        button: TextStyle(fontSize: 18, color: ColorsApp.white),
        subtitle1: TextStyle(fontSize: 16, color: ColorsApp.blackText),
        subtitle2: TextStyle(fontSize: 14, color: ColorsApp.blackText),
        headline6: TextStyle(fontSize: 22, color: ColorsApp.blue),
      )
      .apply(
          // bodyColor: const Color(0xFF687084),
          // displayColor:  const Color(0xFF687084),
          );

  return textTheme;
}

ThemeData appThemeData(BuildContext context) => ThemeData(
      primaryColor: Color(0xff0066b3),
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      appBarTheme: AppBarTheme(
          foregroundColor: Colors.white //here you can give the text color
          ),
      colorScheme: ColorScheme(
        primary: Color(0xff0066b3),
        secondary: Color(0xff95A8B5),
        brightness: Brightness.light,
        error: Colors.red,
        onBackground: Color(0xffDFE4E7),
        onError: Colors.white,
        onPrimary: Color(0xFF565656),
        onSecondary: Colors.white,
        onSurface: Color(0xffC0C8CD),
        surface: Color(0xffE5E5E5),
        background: Color(0xFF828282),
      ),
      textTheme: _getTextTheme(Theme.of(context)),
    );
