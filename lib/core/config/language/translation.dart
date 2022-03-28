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
          'confirm_password': 'Nhập lại mật khẩu',
          'login': 'Đăng nhập',
          'forgot_pass': 'Quên mật khẩu',
          'submit': 'Xác nhận',
          'succes': 'Thành công',
          'validate_pass': 'Mật khẩu có độ dài từ 5 đến 15 kí tự.',
          'pass_dơes_not_match': 'Mật khẩu không trùng khớp',
          'week': 'Tuần',
          'month': 'Tháng',
          'profile': 'Thông tin cá nhân',
          'setting': 'Cài đặt',
          'feedback': 'Phản hồi',
          'logout': 'Đăng xuất',
          'test_supervision': 'giám sát thi',
          'chart': 'Biểu đồ',
          'notification': 'Thông báo', 
        }
      };
}
