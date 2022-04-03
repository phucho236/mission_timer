import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/src/widget/indicator.dart';

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Indicator(
          color: ColorsApp.blue,
          text: 'attended'.tr,
          isSquare: true,
        ),
        Indicator(
          color: ColorsApp.hyperlink,
          text: 'will_attend'.tr,
          isSquare: true,
        ),
        Indicator(
          color: Color(0xff845bef),
          text: 'unconfimred'.tr,
          isSquare: true,
        ),
        Indicator(
          color: ColorsApp.red,
          text: 'not_attended_yet'.tr,
          isSquare: true,
        ),
      ],
    );
  }
}
