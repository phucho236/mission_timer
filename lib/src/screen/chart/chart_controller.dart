import 'package:fl_chart/fl_chart.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/statistical_model.dart';
import 'package:mission_timer/core/model/year_model.dart';
import 'package:mission_timer/src/repositories/user/user_repository.dart';

class ChartController extends GetxController {
  YearModel? schoolYearSelected;
  List<YearModel> listYearModel = [];
  List<StatisticalModel> listStatisModel = [];
  String? chartSelected;
  bool isLoading = false;
  UserRepository _ur = UserRepository();
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    isLoading = true;
    update(["layout"]);
    listYearModel = await _ur.getYear();
    schoolYearSelected = listYearModel.first;
    // chartSelected = Const.lstChart.first;
    listStatisModel = await _ur.getStatistical(schoolYearSelected!.id!);
    isLoading = false;
    update(["layout"]);
  }

  void onChangeSchoolyeah(YearModel schoolYearModel) async {
    schoolYearSelected = schoolYearModel;
    update(['/yearSchool']);

    listStatisModel = await _ur.getStatistical(schoolYearSelected!.id!);
    update(["selectedChart"]);
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
