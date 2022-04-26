import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/task_model.dart';

abstract class IUserRepository {
  Future<bool>? updateProfile({
    String? address,
    String? phone,
    String? avatar,
  });

  Future<bool>? updateAvatar(
      {String? path, required Function(List<String>) callbackUpdate});
  Future<List<MergeTaskModel>?> getTasks();
  Future<bool?> updateStatusTask(String id, StatusTask status,
      {String? content});
}
