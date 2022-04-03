import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';

class BaseLayout extends StatelessWidget with ThemeDataMixin {
  const BaseLayout({
    this.turnOnBack = true,
    this.titleForm = "",
    required this.child,
    Key? key,
  }) : super(key: key);
  final bool? turnOnBack;
  final String? titleForm;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleForm ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: child)
            //child,
          ],
        ),
      ),
    );
  }
}
