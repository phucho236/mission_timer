import 'package:mission_timer/core/clients/handle_repository_call.dart';
import 'package:mission_timer/core/const/api_path.dart';
import 'package:mission_timer/core/helper/enum/enum.dart';

import 'package:mission_timer/src/clients/dio_clients.dart';
import 'package:mission_timer/src/repositories/auth/i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  @override
  Future logIn({required String id, required String pass}) async {
    final response = await handleRepositoryCall(DioClient().call(DioParams(
        HttpMethod.POST,
        endpoint: Path.login,
        body: {'userId': id, 'password': pass})));
  }
}
