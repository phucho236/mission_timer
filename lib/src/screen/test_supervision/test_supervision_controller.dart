import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/helper/validate/validate.dart';

import 'package:mission_timer/src/widget/text_field_custom.dart';

class TestSupervisioController extends GetxController {
  Map<String, TextEditingController> textEditingControllers = {};
  Map<String, GlobalKey<FormState>> formKeys = {};

  List<TestSupervisionModel> process = [
    TestSupervisionModel(
        id: "0",
        schoolYear: "2021-2022",
        semester: 'Học kì 1',
        timeStart: null,
        timeEnd: null,
        report: "đây là report"),
    TestSupervisionModel(
        id: "1",
        schoolYear: "2021-2022",
        semester: 'Học kì 1',
        timeStart: null,
        timeEnd: null,
        report: "đây là report"),
  ];
  List<TestSupervisionModel> readyReport = [
    TestSupervisionModel(
        id: "2",
        schoolYear: "2021-2022",
        semester: 'Học kì 1',
        timeStart: null,
        timeEnd: null,
        report: "đây là report"),
    TestSupervisionModel(
        id: "3",
        schoolYear: "2021-2022",
        semester: 'Học kì 1',
        timeStart: null,
        timeEnd: null,
        report: "đây là report"),
  ];
  List<TestSupervisionModel> endeds = [
    TestSupervisionModel(
        id: "4",
        schoolYear: "2021-2022",
        semester: 'Học kì 1',
        timeStart: null,
        timeEnd: null,
        report: "đây là report"),
    TestSupervisionModel(
        id: "5",
        schoolYear: "2021-2022",
        semester: 'Học kì 1',
        timeStart: null,
        timeEnd: null,
        report: "đây là report"),
  ];

  @override
  void onInit() {
    super.onInit();
    process.forEach((element) {
      var textEditingController = new TextEditingController(text: element.id);
      textEditingController.text = element.report!;
      final _formKey = GlobalKey<FormState>();
      formKeys.putIfAbsent(element.id!, () => _formKey);
      textEditingControllers.putIfAbsent(
          element.id!, () => textEditingController);
      element.widget = Form(
        key: _formKey,
        child: TextFieldCustom(
          validate: (value) => Validate().validateText(value, "bao cao"),
          textEditingController: textEditingController,
          hint: "Vui long nhap bao cao",
        ),
      );
      return;
    });
    endeds.forEach((element) {
      var textEditingController = new TextEditingController(text: element.id);
      textEditingController.text = element.report!;

      textEditingControllers.putIfAbsent(
          element.id!, () => textEditingController);
      final _formKey = GlobalKey<FormState>();
      formKeys.putIfAbsent(element.id!, () => _formKey);
      element.widget = Form(
        key: _formKey,
        child: TextFieldCustom(
          validate: (value) => Validate().validateText(value, "bao cao"),
          textEditingController: textEditingController,
          hint: "Vui long nhap bao cao",
        ),
      );
      return;
    });
    readyReport.forEach((element) {
      var textEditingController = new TextEditingController(text: element.id);
      textEditingController.text = element.report!;
      final _formKey = GlobalKey<FormState>();
      formKeys.putIfAbsent(element.id!, () => _formKey);
      textEditingControllers.putIfAbsent(
          element.id!, () => textEditingController);
      element.widget = Form(
        key: _formKey,
        child: TextFieldCustom(
          validate: (value) => Validate().validateText(value, "bao cao"),
          textEditingController: textEditingController,
          hint: "Vui long nhap bao cao",
        ),
      );
      return;
    });
  }
}

class TestSupervisionModel {
  TestSupervisionModel(
      {this.id,
      this.schoolYear,
      this.semester,
      this.timeStart,
      this.timeEnd,
      this.isEnded,
      this.report,
      this.widget});

  String? id;
  String? schoolYear;
  String? semester;
  DateTime? timeStart;
  DateTime? timeEnd;
  bool? isEnded;
  String? report;
  Widget? widget;
}
