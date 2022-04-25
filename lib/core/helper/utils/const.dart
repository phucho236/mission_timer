import 'package:get/get.dart';
import 'package:mission_timer/core/model/year_model.dart';

class Const {
  Const(_);
  static List<YearModel> lstSchoolYear = [
    YearModel(id: "1", name: '2020-2021'),
    YearModel(id: "2", name: '2018-2019'),
    YearModel(id: "3", name: '2019-2020'),
    YearModel(id: "4", name: '2020-2021')
  ];
  static List<String> lstChart = [
    'bar_chart'.tr,
    'pie_chart'.tr,
  ];
}

enum StatusTask { accept, refuse, done, incomplete, notAnswered }
