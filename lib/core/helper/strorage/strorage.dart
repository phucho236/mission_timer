import 'dart:convert';

import 'package:get/get.dart';
import 'package:mission_timer/core/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_element
const _LANGUAGE_CODE_KEY = '/language_code_key';
const _USER_MODEL_KEY = '/user_model_key';
const _TOKEN_KEY = '/token_key';

class Strorage extends GetxService {
  final SharedPreferences preferences;
  Strorage({required this.preferences});
}

extension LanguageCodeStrorage on Strorage {
  Future<void> saveLanguageCode(String languageCode) async {
    await preferences.setString(_LANGUAGE_CODE_KEY, languageCode);
  }

  Future<void> deleteLanguageCode() async {
    await preferences.remove(_LANGUAGE_CODE_KEY);
  }

  String? get getLanguageCode =>
      preferences.getString(_LANGUAGE_CODE_KEY) ?? null;
}

extension UserModelStrorage on Strorage {
  Future<void> saveUserModel(UserModel userModel) async {
    await preferences.setString(
        _USER_MODEL_KEY, jsonEncode(userModel.toJson()));
  }

  Future<void> deleteUserModel() async {
    await preferences.remove(_USER_MODEL_KEY);
  }

  UserModel? get getUserModel {
    String? value = preferences.getString(_USER_MODEL_KEY) ?? null;
    if (value != null) {
      return UserModel.fromJson(jsonDecode(value));
    }
    return null;
  }
}

extension TokenStrorage on Strorage {
  Future<void> saveToken(String token) async {
    await preferences.setString(_TOKEN_KEY, token);
  }

  Future<void> deleteToken() async {
    await preferences.remove(_TOKEN_KEY);
  }

  String? get getToken => preferences.getString(_TOKEN_KEY) ?? null;
}
