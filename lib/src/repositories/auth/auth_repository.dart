import 'package:get/get.dart';
import 'package:mission_timer/core/clients/handle_repository_call.dart';
import 'package:mission_timer/core/const/api_path.dart';
import 'package:mission_timer/core/helper/enum/enum.dart';
import 'package:mission_timer/core/helper/strorage/strorage.dart';
import 'package:mission_timer/core/model/user_model.dart';

import 'package:mission_timer/src/clients/dio_clients.dart';
import 'package:mission_timer/src/repositories/auth/i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  @override
  Future<UserModel?>? logIn({required String id, required String pass}) async {
    UserModel? userModel;
    final response = await handleRepositoryCall(DioClient().call(
      DioParams(HttpMethod.POST,
          needAuthrorize: false,
          endpoint: Path.login,
          body: {'userId': id, 'password': pass}),
    ));

    if (response != null) {
      userModel = UserModel.fromJson(response["user"]);
      Get.find<Strorage>().saveUserModel(userModel);
      Get.find<Strorage>().saveToken(response["token"]);
    }

    return userModel;
  }

  @override
  Future<bool>? changePass(
      {required String pass,
      required,
      required String uuid,
      required String otp}) async {
    final response = await handleRepositoryCall(
        DioClient().call(
          DioParams(
            HttpMethod.POST,
            endpoint: Path.changePass,
            body: {"userId": uuid, "otp": otp, "newPassword": pass},
          ),
        ),
        noBody: true);
    try {
      if (response["code"] == 1) {
        return true;
      }
    } catch (e) {}
    return false;
  }

  @override
  Future<bool>? sendMail({required String userId}) async {
    final response = await handleRepositoryCall(
        DioClient().call(
            DioParams(
              HttpMethod.POST,
              endpoint: Path.forgotPassword,
              body: {
                'userId': userId,
              },
            ),
            contentType: "Application/json"),
        noBody: true);
    if (response["code"] == 1) {
      return true;
    }
    return false;
  }

  @override
  Future<bool>? firstChangePass(
      {required String oldPass, required String newPass}) async {
    final response = await handleRepositoryCall(
        DioClient().call(
          DioParams(HttpMethod.PUT,
              endpoint: Path.firstChangePass,
              body: {'currentPassword': oldPass, 'newPassword': newPass}),
        ),
        noBody: true);
    if (response['code'] == 1) {
      return true;
    }
    return false;
  }

  @override
  Future<bool>? verifyOTP({required String otp, required String userId}) async {
    final response = await handleRepositoryCall(
        DioClient().call(
          DioParams(HttpMethod.POST,
              endpoint: Path.verifyOPT, body: {'userId': userId, 'otp': otp}),
        ),
        noBody: true);
    try {
      if (response?['code'] == 1) {
        return true;
      }
    } catch (e) {}
    return false;
  }
}
