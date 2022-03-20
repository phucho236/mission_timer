import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ThemeDataMixin {
  TextTheme get textTheme => Theme.of(Get.context!).textTheme;
  ColorScheme get colorScheme => Theme.of(Get.context!).colorScheme;
}
