import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/school_year_model.dart';
import 'package:mission_timer/src/screen/chart/chart_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/indicator.dart';

class ChartScreen extends StatefulWidget {
  static const String router = "/ChartScreen";
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartScreenState();
}

class ChartScreenState extends State with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: 'chart'.tr,
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GetBuilder<ChartController>(
                    id: '/chart',
                    init: ChartController(),
                    builder: (controller) {
                      return PieChart(
                        PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event,
                                      PieTouchResponse? pieTouchResponse) =>
                                  controller.touchCallback(
                                      event, pieTouchResponse),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: showingSections(controller)),
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GetBuilder<ChartController>(
                    init: ChartController(),
                    id: '/yearSchool',
                    builder: (controller) {
                      return Row(
                        children: [
                          Text(
                            'school_year'.tr,
                            style: textTheme.subtitle1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<SchoolYearModel>(
                            value: controller.selectedSchoolYear,
                            items: Const.lstSchoolYear
                                .map<DropdownMenuItem<SchoolYearModel>>(
                                    (SchoolYearModel value) {
                              return DropdownMenuItem<SchoolYearModel>(
                                value: value,
                                child: Text(
                                  value.schoolYear!,
                                  style: textTheme.subtitle1,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) =>
                                controller.onChangeSchoolyeah(value!),
                          ),
                        ],
                      );
                    },
                  ),
                  Indicators()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(ChartController chartController) {
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
