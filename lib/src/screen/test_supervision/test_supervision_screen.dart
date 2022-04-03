import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/helper/toast/toast.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';
import 'package:mission_timer/core/model/school_year_model.dart';
import 'package:mission_timer/src/screen/chart/chart_controller.dart';
import 'package:mission_timer/src/screen/test_supervision/test_supervision_controller.dart';
import 'package:mission_timer/src/widget/base_layout/base_layout.dart';
import 'package:mission_timer/src/widget/title_bar.dart';

class TestSupervisionScreen extends StatefulWidget {
  static const String router = "/TestSupervisionScreen";
  const TestSupervisionScreen({Key? key}) : super(key: key);

  @override
  State<TestSupervisionScreen> createState() => _TestSupervisionScreenState();
}

class _TestSupervisionScreenState extends State<TestSupervisionScreen>
    with ThemeDataMixin {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      titleForm: 'test_supervision'.tr,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TitleBar(title: 'progress'.tr),
          GetBuilder<TestSupervisioController>(
            id: '/process',
            init: TestSupervisioController(),
            builder: (controller) => Column(
              children: List.generate(
                controller.process.length,
                (index) => ExpansionTile(
                  title: Text(controller.process[index].semester!),
                  subtitle: Text(controller.process[index].schoolYear!),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: controller.readyReport[index].widget!,
                          ),
                          IconButton(
                            onPressed: () {
                              if (controller
                                  .formKeys[controller.readyReport[index].id]!
                                  .currentState!
                                  .validate()) {
                                Toast().showToat("msf");
                              }
                            },
                            icon: Icon(Icons.save),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          TitleBar(
            title: 'ready_report'.tr,
          ),
          GetBuilder<TestSupervisioController>(
            id: '/ready_report',
            init: TestSupervisioController(),
            builder: (controller) => Column(
              children: List.generate(
                controller.readyReport.length,
                (index) => ExpansionTile(
                  title: Text(controller.readyReport[index].semester!),
                  subtitle: Text(controller.readyReport[index].schoolYear!),
                  children: [
                    Row(
                      children: [
                        controller.readyReport[index].widget!,
                        IconButton(
                          onPressed: () {
                            if (controller
                                .formKeys[controller.readyReport[index].id]!
                                .currentState!
                                .validate()) {
                              Toast().showToat("msf");
                            }
                          },
                          icon: Icon(Icons.save),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          TitleBar(
            title: 'ended'.tr,
            widget: GetBuilder<ChartController>(
              init: ChartController(),
              id: '/yearSchool',
              builder: (controller) {
                return Row(
                  children: [
                    Text(
                      'school_year'.tr,
                      style: textTheme.bodyText1,
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
                          child: Text(value.schoolYear!),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          controller.onChangeSchoolyeah(value!),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
