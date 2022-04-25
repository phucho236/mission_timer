import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/const.dart';

class ColorsApp {
  static ColorsApp shared = ColorsApp._();
  factory ColorsApp() => shared;
  const ColorsApp._();

  static const mainColor = Color(0xfff9f9f9);

  static const backgroundTextField = Color(0xffEDEFF2);

  static const blue = Color(0xff0066b3);
  static const colorButton = Color(0xff0066b3);
  static const blackText = Color(0xff3A3E52);
  static const white = Colors.white;
  static const red = Color(0xffF47B7B);
  static const gray = Color(0xff9099B2);
  static const link = Color(0xff4866B9);
  static const borderGray = Color(0xffC2C8D7);
  static const textDialog = Color(0xff687084);
  static const mediaSelect = Color(0xff6C90F3);
  static const fullScreenDialog = Color(0xfff2f2f2);
  static const grayLine = Color(0xffADB5D0);
  static const hyperlink = Color(0xff4285F4);
  static getColorStatusTask(StatusTask? statusTask) {
    switch (statusTask) {
      case StatusTask.notAnswered:
        return Color(0xff845bef);
      case StatusTask.accept:
        return hyperlink;
      case StatusTask.incomplete:
        return red;
      case StatusTask.refuse:
        return red;
      case StatusTask.done:
        return blue;
      default:
        return grayLine;
    }
  }
  // color
}
