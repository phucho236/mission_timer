import 'package:mission_timer/core/model/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel?>? logIn({required String id, required String pass});
  Future<bool>? sendMail({required String userId});
  Future<bool>? changePass({required String pass, required String uuid, required String otp});
  Future<bool>? firstChangePass(
      {required String oldPass, required String newPass});
  Future<bool>? verifyOTP({required String otp, required String userId});
   
}
