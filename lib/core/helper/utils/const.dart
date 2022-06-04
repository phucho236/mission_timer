import 'package:get/get.dart';
import 'package:mission_timer/core/model/year_model.dart';

class Const {
  Const(_);
  static List<YearModel> lstSchoolYear = [
    YearModel(id: "1", name: '2020-2021'),
    YearModel(id: "2", name: '2019-2020'),
    YearModel(id: "3", name: '2018-2019'),
    YearModel(id: "4", name: '2017-2018')
  ];
  static List<String> lstChart = [
    'bar_chart'.tr,
    'pie_chart'.tr,
  ];
}

String getNameStatusTask(String status) {
  StatusTask statusEnum = StatusTask.values
      .firstWhere((e) => e.toString() == 'StatusTask.' + status);
  switch (statusEnum) {
    case StatusTask.notAnswered:
      return "Chưa rõ";
    case StatusTask.accept:
      return "Đồng ý tham gia";
    case StatusTask.incomplete:
      return "Chưa hoàn thành";
    case StatusTask.refuse:
      return "Từ chối tham gia";
    case StatusTask.done:
      return "Đã hoàn thành";
    default:
      return "Chưa rõ";
  }
}

enum StatusTask { accept, refuse, done, incomplete, notAnswered }
