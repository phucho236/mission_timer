import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';

class BaseLayout extends StatelessWidget with ThemeDataMixin {
  const BaseLayout({
    this.turnOnBack = false,
    this.titleForm = "",
    required this.child,
    Key? key,
  }) : super(key: key);
  final bool? turnOnBack;
  final String? titleForm;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: turnOnBack! ? 1 : 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    titleForm!.toUpperCase(),
                    style: textTheme.headline6!,
                  ),
                ),
              ),
              SizedBox(child: child)
              //child,
            ],
          ),
        ),
      ),
    );
  }
}
