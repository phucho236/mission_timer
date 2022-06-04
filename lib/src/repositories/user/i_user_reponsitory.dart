import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/statistical_model.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:mission_timer/core/model/year_model.dart';

abstract class IUserRepository {
  Future<bool>? updateProfile({
    String? address,
    String? phone,
    String? avatar,
    String? email,
  });

  Future<List<MergeTaskModel>?> getTasks();
  Future<bool?> updateStatusTask(String id, StatusTask status,
      {String? content});

  Future<UserModel> getProfile();

  Future<List<YearModel>> getYear();
  Future<List<StatisticalModel>> getStatistical(String yearId);
}
