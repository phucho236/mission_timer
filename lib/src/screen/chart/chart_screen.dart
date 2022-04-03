import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/school_year_model.dart';
import 'package:mission_timer/src/screen/chart/chart_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/chart/grouped_bar_chart.dart';
import 'package:mission_timer/src/widget/chart/indicators.dart';
import 'package:mission_timer/src/widget/chart/pie_chart_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartScreen extends StatefulWidget {
  static const String router = "/ChartScreen";
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartScreenState();
}

class ChartScreenState extends State with ThemeDataMixin {
  List<charts.Series<dynamic, String>> seriesList = [];
  @override
  void initState() {
    seriesList.add(
      charts.Series(
        id: '1',
        displayName: '1',
        data: ['aaa', 'aaa', 'aaa', 'aaa'],
        measureFn: (value, value1) {},
        domainFn: (value, value1) {
          return 'aaa';
        },
      ),
    );
    seriesList.add(
      charts.Series(
        id: '2',
        displayName: '2',
        data: ['aaa', 'aaa', 'aaa', 'aaa'],
        measureFn: (value, value1) {},
        domainFn: (value, value1) {
          return 'ccc';
        },
      ),
    );
    seriesList.add(
      charts.Series(
        id: '3',
        displayName: '3',
        data: ['aaa', 'aaa', 'aaa', 'aaa'],
        measureFn: (value, value1) {},
        domainFn: (value, value1) {
          return 'bbb';
        },
      ),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: 'chart'.tr,
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child:
                    // PieChartWidget(),
                    GroupedBarChart.withRandomData(),
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
    );
  }
}
