import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/school_year_model.dart';
import 'package:mission_timer/src/screen/chart/chart_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/chart/grouped_bar_chart.dart';
import 'package:mission_timer/src/widget/chart/indicators.dart';
import 'package:mission_timer/src/widget/chart/pie_chart_widget.dart';

class ChartScreen extends StatefulWidget {
  static const String router = "/ChartScreen";
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartScreenState();
}

class ChartScreenState extends State with ThemeDataMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: 'chart'.tr,
      child: AspectRatio(
        aspectRatio: 1,
        child: GetBuilder<ChartController>(
          init: ChartController(),
          id: '/selectedChart',
          builder: (controller) => controller.chartSelected == Const.lstChart.first
              ? Column(
                  children: [
                    Expanded(
                      child: GroupedBarChart.withRandomData(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [ContentChart()],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: PieChartWidget(),
                    ),
                    ContentChart(),
                  ],
                ),
        ),
      ),
    );
  }
}

class ContentChart extends StatelessWidget with ThemeDataMixin {
  const ContentChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GetBuilder<ChartController>(
          init: ChartController(),
          id: '/type_chart',
          builder: (controller) {
            return Row(
              children: [
                Text(
                  'type_chart'.tr,
                  style: textTheme.subtitle1,
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  value: controller.chartSelected,
                  items: Const.lstChart
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: textTheme.subtitle1,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) =>
                      controller.onChangeChartSelected(value!),
                ),
              ],
            );
          },
        ),
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
                  value: controller.schoolYearSelected,
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
                  onChanged: (value) => controller.onChangeSchoolyeah(value!),
                ),
              ],
            );
          },
        ),
        Indicators()
      ],
    );
  }
}
