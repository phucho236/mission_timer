import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';

class BaseLayout extends StatelessWidget with ThemeDataMixin {
  const BaseLayout({
    this.turnOnBack = true,
    this.isLoading = false,
    this.titleForm = "",
    required this.child,
    this.isSingleChildScrollView = true,
    Key? key,
  }) : super(key: key);
  final bool? turnOnBack;
  final String? titleForm;
  final Widget child;
  final bool isLoading;
  final bool isSingleChildScrollView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleForm ?? ""),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isSingleChildScrollView
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(child: child)
                      //child,
                    ],
                  ),
                )
              : child,
    );
  }
}
