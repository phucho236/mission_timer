import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import 'package:mission_timer/core/clients/handle_repository_call.dart';
import 'package:mission_timer/core/const/api_path.dart';
import 'package:mission_timer/core/helper/enum/enum.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/model/activity_model.dart';
import 'package:mission_timer/core/model/task_model.dart';
import 'package:mission_timer/src/clients/dio_clients.dart';

import 'i_user_reponsitory.dart';

class UserRepository extends IUserRepository {
  @override
  Future<bool>? updateProfile({
    String? address,
    String? phone,
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
    if (data.isNotEmpty) {
      final result = await handleRepositoryCall(
        DioClient().call(
          DioParams(
            HttpMethod.PUT,
            endpoint: Path.updateProfile,
            body: data,
          ),
        ),
      );
      if (result != null) {
        return true;
      }
    }
    return false;
  }

  // @override
  // Future<bool>? postFile({String? path}) async {}

  @override
  Future<bool>? updateAvatar(
      {String? path, required Function(List<String>) callbackUpdate}) async {
    final result = await handleRepositoryCall(
        DioClient()
            .uploadFile(path!, endpoint: Path.uploadAvatar, field: 'NAME'),
        noBody: true);

    if (result != null) {
      // callbackUpdate(['/avatar']);
      return true;
    }
    return false;
  }

  @override
  Future<List<ActivityModel>>? getActivity({required String idYear}) async {
    List<ActivityModel> activitys = [];
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(
          HttpMethod.GET,
          endpoint: Path.getActivitys + idYear,
        ),
      ),
    );
    if (result != null) {
      activitys = (JsonDecoder(result['activity']) as List)
          .map((data) => ActivityModel.fromJson(data))
          .toList();
    }
    return activitys;
  }

  @override
  Future<List<TaskModel>>? getTask() async {
    List<TaskModel> task = [];
    final result = await handleRepositoryCall(
      DioClient().call(
        DioParams(
          HttpMethod.GET,
          endpoint: Path.getTasks,
        ),
      ),
    );
    if (result != null) {
      task = (result['tasks'] as List)
          .map((data) => TaskModel.fromJson(data))
          .toList();
    }
    return task;
  }
}
