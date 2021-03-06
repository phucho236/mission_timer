import 'package:get/get.dart' as getx;
import 'package:mission_timer/core/helper/extension/date_time_extension.dart';
import 'package:mission_timer/core/clients/handle_repository_call.dart';
import 'package:mission_timer/core/const/api_path.dart';
import 'package:mission_timer/core/helper/enum/enum.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/helper/utils/const.dart';
import 'package:mission_timer/core/model/notification_model.dart';
import 'package:mission_timer/core/model/statistical_model.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:mission_timer/core/model/year_model.dart';
import 'package:mission_timer/src/clients/dio_clients.dart';
import 'package:mission_timer/src/screen/notification/notification_controller.dart';

import 'i_user_reponsitory.dart';

class UserRepository extends IUserRepository {
  @override
  Future<bool>? updateProfile({
    String? address,
    String? phone,
    String? avatar,
    String? email,
  }) async {
    Map<String, dynamic> data = {};

    final Strorage strorage = getx.Get.find<Strorage>();

    if (address != null &&
        address.isNotEmpty &&
        address != strorage.getUserModel!.address) {
      data.addEntries([MapEntry("address", address)]);
    }
    if (phone != null &&
        phone.isNotEmpty &&
        phone != strorage.getUserModel!.phone) {
      data.addEntries([MapEntry("phone", phone)]);
    }
    if (avatar != null) {
      data.addEntries([MapEntry("avatar", avatar)]);
    }
    if (email != null) {
      data.addEntries([MapEntry("email", email)]);
    }
    if (data.isNotEmpty) {
      final result = await handleRepositoryCall(
          DioClient().call(
            DioParams(
              HttpMethod.PUT,
              endpoint: Path.updateProfile,
              body: data,
            ),
          ),
          noBody: true);
      if (result["code"] == 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<List<MergeTaskModel>?> getTasks() async {
    List<TaskModel> taskModels = [];
    List<MergeTaskModel> mergeTaskModels = [];
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(
          HttpMethod.GET,
          endpoint: Path.tasks,
        ),
      ),
    );
    if (result != null) {
      taskModels = (result['tasks'] as List)
          .map((data) => TaskModel.fromJson(data))
          .toList();
      if (taskModels.isNotEmpty) {
        for (int i = 0; i < taskModels.length; i++) {
          bool finded = false;
          int index = mergeTaskModels.indexWhere((element) =>
              element.date!.isSameDay(taskModels[i].task!.startDate!));
          if (index != -1) {
            finded = true;
            mergeTaskModels[index].taskmodels!.add(taskModels[i]);
          }
          if (!finded) {
            mergeTaskModels.add(MergeTaskModel(
                date: taskModels[i].task!.startDate!,
                taskmodels: [taskModels[i]]));
          }
        }
      }
    }
    return mergeTaskModels;
  }

  @override
  Future<bool?> updateStatusTask(String id, StatusTask status,
      {String? content, String? image}) async {
    Map<String, dynamic> data = {'status': status.name};
    if (content != null) {
      data.addAll({'content': content});
    }
    if (image != null) {
      data.addAll({'image': image});
    }
    final result = await handleRepositoryCall(
        DioClient().call(
          DioParams(HttpMethod.PUT, endpoint: Path.acceptTask(id), body: data),
        ),
        noBody: true);

    if (result['code'] == 1) return true;
    return false;
  }

  @override
  Future<UserModel> getProfile() async {
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(HttpMethod.GET, endpoint: Path.getProfile),
      ),
    );

    return UserModel.fromJson(result['profile']);
  }

  @override
  Future<List<YearModel>> getYear() async {
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(HttpMethod.GET, endpoint: Path.getYear),
      ),
    );
    print(result);
    List<YearModel>? listYear = List<YearModel>.from(
        (result["years"]).map((x) => YearModel.fromJson(x)));
    if (listYear.isNotEmpty) return listYear;
    return [];
  }

  @override
  Future<List<StatisticalModel>> getStatistical(String yearId) async {
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(HttpMethod.GET,
            endpoint: Path.getStatistical, params: {"year": yearId}),
      ),
    );

    List<StatisticalModel> listStatis = List<StatisticalModel>.from(
        (result["statistic"]).map((x) => StatisticalModel.fromJson(x)));
    if (listStatis.isNotEmpty) return listStatis;
    return [];
  }

  @override
  Future<List<NotificationModel>> getNotifiCation({int? page}) async {
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(HttpMethod.GET,
            endpoint: Path.getNotification,
            body: {"limit": "10", "page": page ?? 1}),
      ),
    );

    List<NotificationModel> list = List<NotificationModel>.from(
        (result["notifications"]).map((x) => NotificationModel.fromJson(x)));
    if (list.isNotEmpty) return list;
    return [];
  }

  @override
  Future<bool> updateReadedNoti(String id) async {
    final result = await handleRepositoryCall(
        DioClient().call(
          DioParams(HttpMethod.PUT, endpoint: Path.updateReadedNoti(id)),
        ),
        noBody: true);

    if (result['code'] == 1) return true;
    return false;
  }
}
