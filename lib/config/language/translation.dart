import 'package:get/get.dart';

class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VI': {
          //common
          'id_teacher': 'Mã giảng viên',
          'pl_input': 'Vui lòng nhập',
          'is_number': 'phải là số',
          'password': 'Mật khẩu',
          'login': 'Đăng nhập',
          'forgot_pass': 'Quên mật khẩu',
          'submit': 'Xác nhận',
        }
      };
}
