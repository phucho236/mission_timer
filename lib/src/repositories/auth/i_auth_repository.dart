

import 'package:mission_timer/core/model/user_model.dart';

abstract class IAuthRepository {
  Future<bool>? logIn({required String id, required String pass});
}
