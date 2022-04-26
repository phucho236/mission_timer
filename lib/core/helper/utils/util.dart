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
          titlePadding: EdgeInsets.zero,
          title: Stack(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title ?? ""),
              )),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close)),
              )
            ],
          ),
          content: SingleChildScrollView(child: content),
        );
      },
    );
  }
}
