import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/src/screen/chart/chart_controller.dart';

class PieChartWidget extends StatelessWidget with ThemeDataMixin {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PieChartController>(
      id: '/chart',
      init: PieChartController(),
      builder: (controller) {
        return PieChart(
          PieChartData(
              pieTouchData: PieTouchData(
                touchCallback:
                    (FlTouchEvent event, PieTouchResponse? pieTouchResponse) =>
                        controller.touchCallback(event, pieTouchResponse),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: showingSections(controller)),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections(
      PieChartController chartController) {
    return List.generate(4, (i) {
      final isTouched = i == chartController.touchedIndex;
      //final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: ColorsApp.blue,
              value: 40,
              title: '40%',
              radius: radius,
              titleStyle:
                  textTheme.subtitle1!.copyWith(color: ColorsApp.white));
        case 1:
          return PieChartSectionData(
              color: ColorsApp.hyperlink,
              value: 30,
              title: '30%',
              radius: radius,
              titleStyle:
                  textTheme.subtitle1!.copyWith(color: ColorsApp.white));
        case 2:
          return PieChartSectionData(
              color: const Color(0xff845bef),
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle:
                  textTheme.subtitle1!.copyWith(color: ColorsApp.white));
        case 3:
          return PieChartSectionData(
              color: ColorsApp.red,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle:
                  textTheme.subtitle1!.copyWith(color: ColorsApp.white));
        default:
          throw Error();
      }
    });
  }
}
