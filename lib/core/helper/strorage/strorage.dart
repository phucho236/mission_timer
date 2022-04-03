import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_element
const _LANGUAGE_CODE_KEY = '/language_code_key';

class Strorage extends GetxService {
  final SharedPreferences preferences;
  Strorage({required this.preferences});
}

// class Strorage {
//   // Future<PointModel?> getPointSetting() async {
//   //   String? value = await _storage.read(key: 'poin_setting');
//   //   if (value != null) {
//   //     print(json.decode(value));
//   //     return PointModel.fromJson(json.decode(value));
//   //   }
//   //   return null;
//   // }

//   // Future<void> setPointSetting(PointModel poinSetting) async {
//   //   print(poinSetting.toJson().toString());
//   //   await _storage.write(key: 'poin_setting', value: jsonEncode(poinSetting));
//   // }

//   // Future<void> deletePointSetting() async {
//   //   await _storage.delete(key: 'poin_setting');
//   // }

// }

extension LanguageCode on Strorage {
  Future<void> saveLanguageCode(String languageCode) async {
    await preferences.setString(_LANGUAGE_CODE_KEY, languageCode);
  }

  Future<void> deleteLanguageCode() async {
    await preferences.remove(_LANGUAGE_CODE_KEY);
  }

  String? get getLanguageCode =>
      preferences.getString(_LANGUAGE_CODE_KEY) ?? null;
}
