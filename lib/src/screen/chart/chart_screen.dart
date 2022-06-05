import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/year_model.dart';
import 'package:mission_timer/src/screen/chart/chart_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/chart/grouped_bar_chart.dart';
import 'package:mission_timer/src/widget/chart/indicators.dart';

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

  String fortmatText(int value) {
    return value < 10 ? " $value" : "$value";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
        id: "layout",
        init: ChartController(),
        builder: (controller) {
          return BaseLayout(
            titleForm: 'chart'.tr,
            isLoading: controller.isLoading,
            child: AspectRatio(
              aspectRatio: 1,
              child: GetBuilder<ChartController>(
                  id: '/selectedChart',
                  builder: (controller) => Column(
                        children: [
                          Expanded(
                            child: GroupedBarChart.withData(
                                controller.listStatisModel),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(fortmatText(controller
                                        .listStatisModel[0].countDone!)),
                                    Text(fortmatText(controller
                                        .listStatisModel[0].countAccepted!)),
                                    Text(fortmatText(controller
                                        .listStatisModel[0].notAnswered!)),
                                    Text(fortmatText(controller
                                            .listStatisModel[0].countRefuse! +
                                        controller.listStatisModel[0]
                                            .countIncomplete!)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(fortmatText(controller
                                        .listStatisModel[1].countDone!)),
                                    Text(fortmatText(controller
                                        .listStatisModel[1].countAccepted!)),
                                    Text(fortmatText(controller
                                        .listStatisModel[1].notAnswered!)),
                                    Text(fortmatText(controller
                                        .listStatisModel[1].countRefuse!)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 55,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [ContentChart()],
                          ),
                        ],
                      )
                  // :
                  // Row(
                  //     children: [
                  //       Expanded(
                  //         child: PieChartWidget(),
                  //       ),
                  //       ContentChart(),
                  //     ],
                  //   ),
                  ),
            ),
          );
        });
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
                // Text(
                //   'type_chart'.tr,
                //   style: textTheme.subtitle1,
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                // DropdownButton<String>(
                //   value: controller.chartSelected,
                //   items: Const.lstChart
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value,
                //         style: textTheme.subtitle1,
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (value) =>
                //       controller.onChangeChartSelected(value!),
                // ),
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
                DropdownButton<YearModel>(
                  value: controller.schoolYearSelected,
                  items: controller.listYearModel
                      .map<DropdownMenuItem<YearModel>>((YearModel value) {
                    return DropdownMenuItem<YearModel>(
                      value: value,
                      child: Text(
                        value.name!,
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
        Indicators(),
        GetBuilder<ChartController>(
          builder: (controller) {
            return Column(
              children: [
                Text("total".tr +
                    "KH1:  ${controller.listStatisModel[0].sumTask}"),
                Text(
                    "total".tr + "HK2: $controller.listStatisModel[1].sumTask"),
              ],
            );
          },
        ),
      ],
    );
  }
}
