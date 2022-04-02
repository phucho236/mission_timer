import 'package:flutter/material.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';

class TitleBar extends StatelessWidget with ThemeDataMixin {
  const TitleBar({
    required this.title,
    this.widget,
    Key? key,
  }) : super(key: key);

  final String? title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      //  padding: EdgeInsets.all(15),
      width: double.infinity,
      color: ColorsApp.borderGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: textTheme.titleMedium,
            ),
          ),
          widget ?? Container()
        ],
      ),
    );
  }
}