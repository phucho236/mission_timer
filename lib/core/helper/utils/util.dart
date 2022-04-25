import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  Utils(_);
  static Future<void> showMyDialog(
    BuildContext context, {
    String? title,
    Widget? content,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: SingleChildScrollView(child: content),
        );
      },
    );
  }
}
