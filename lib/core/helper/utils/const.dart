import 'package:mission_timer/core/model/school_year_model.dart';

class Const {
  Const(_);
  static List<SchoolYearModel> lstSchoolYear = [
    SchoolYearModel(id: 0, schoolYear: '2020-2021'),
    SchoolYearModel(id: 0, schoolYear: '2018-2019'),
    SchoolYearModel(id: 0, schoolYear: '2019-2020'),
    SchoolYearModel(id: 0, schoolYear: '2020-2021')
  ];
  static List<String> lstChart = [
    "barChart",
    "pieChart",
  ];
}
