import 'package:fl_chart/fl_chart.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/year_model.dart';

class ChartController extends GetxController {
  YearModel? schoolYearSelected;
  String? chartSelected;
  @override
  void onInit() {
    schoolYearSelected = Const.lstSchoolYear.first;
    chartSelected = Const.lstChart.first;

    super.onInit();
  }

  void onChangeSchoolyeah(YearModel schoolYearModel) {
    schoolYearSelected = schoolYearModel;
    update(['/yearSchool']);
  }

  void onChangeChartSelected(String value) {
    chartSelected = value;
    update(['/type_chart', '/selectedChart']);
  }
}

class PieChartController extends GetxController {
  int touchedIndex = -1;
  void touchCallback(FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
    if (!event.isInterestedForInteractions ||
        pieTouchResponse == null ||
        pieTouchResponse.touchedSection == null) {
      touchedIndex = -1;
      return;
    }
    touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
    update(['/chart']);
  }
}
