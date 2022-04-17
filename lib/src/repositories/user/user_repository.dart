import 'package:dio/dio.dart';

import 'package:mission_timer/core/clients/handle_repository_call.dart';
import 'package:mission_timer/core/const/api_path.dart';
import 'package:mission_timer/core/helper/enum/enum.dart';
import 'package:mission_timer/src/clients/dio_clients.dart';

import 'i_user_reponsitory.dart';

class UserRepository extends IUserRepository {
  @override
  Future<bool>? updateProfile(
      {String? address,
      String? phone,
      String? pathAvatar,
      required Function(List<String>) callbackUpdate}) async {
    Map<String, dynamic> data = {};
    List<String> listUpdate = [];

    if (pathAvatar != null) {
      await postFile(path: pathAvatar);
    }
    if (address != null) {
      data.addEntries([MapEntry("address", address)]);
    }
    if (phone != null) {
      data.addEntries([MapEntry("phone", phone)]);
    }
    final response = await handleRepositoryCall(
      DioClient().call(
        DioParams(HttpMethod.PUT, endpoint: Path.updateProfile, body: data),
      ),
    );
    if (response != null) {
      callbackUpdate(listUpdate);
      return true;
    }
    return false;
  }

  @override
  Future<bool>? postFile({String? path}) async {
    FormData formData = FormData.fromMap(
      {
        "NAME": await MultipartFile.fromFile(
          path!,
        ),
      },
    );
    final response = await handleRepositoryCall(
      DioClient().call(
        DioParams(HttpMethod.POST,
            endpoint: Path.uploadFile, formData: formData),
      ),
    );
    print(response);
    return true;
  }
}
