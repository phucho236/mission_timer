import 'dart:collection';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/repositories/user/user_repository.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreenController extends GetxController {
  UserRepository ur = UserRepository();

  LinkedHashMap<DateTime, List<TaskModel>>? taskHashMap;

  @override
  void onInit() {
    super.onInit();
  }

  Future getTasks({Function? updateLayout}) async {
    List<MergeTaskModel>? mergeTask = [];
    mergeTask = await ur.getTasks();

    if (mergeTask!.isNotEmpty) {
      taskHashMap = LinkedHashMap<DateTime, List<TaskModel>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );
      taskHashMap!.addAll(
        Map.fromIterable(
          List.generate(mergeTask.length, (index) => mergeTask?[index]),
          key: (item) {
            print(item);
            return DateTime.utc(item.date.year, item.date.month, item.date.day);
          },
          value: (items) => List.generate(
            items!.taskmodels.length,
            (index) => items!.taskmodels![index],
          ),
        ),
      );
      if (updateLayout != null) {
        updateLayout();
      }
    }
  }

  Future updateStatusTask(
      String idTask, Function updateLayout, StatusTask status,
      {String? content, String? image}) async {
    bool? result = false;
    result = await ur.updateStatusTask(idTask, status,
        content: content, image: image);

    if (result!) {
      getTasks(updateLayout: () {
        updateLayout();
      });
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
