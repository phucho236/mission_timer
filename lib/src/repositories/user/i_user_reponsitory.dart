import 'package:mission_timer/core/model/activity_model.dart';
import 'package:mission_timer/core/model/task_model.dart';

abstract class IUserRepository {
  Future<bool>? updateProfile({
    String? address,
    String? phone,
  });
  // Future<bool>? postFile({
  //   String path,
  // });
  Future<bool>? updateAvatar(
      {String? path, required Function(List<String>) callbackUpdate});
  Future<List<ActivityModel>>? getActivity({required String idYear});
  Future<List<TaskModel>>? getTask();
}
