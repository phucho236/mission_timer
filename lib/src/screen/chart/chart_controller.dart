import 'package:fl_chart/fl_chart.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/school_year_model.dart';

class ChartController extends GetxController {
  
  
  
  
  int touchedIndex = -1;


  SchoolYearModel? selectedSchoolYear;
  @override
  void onInit() {
    selectedSchoolYear = Const.lstSchoolYear.first;

    super.onInit();
  }

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

  void onChangeSchoolyeah(SchoolYearModel schoolYearModel) {
    selectedSchoolYear = schoolYearModel;
    update(['/yearSchool']);
  }

  

  
}
