import 'package:fluttertoast/fluttertoast.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';

class Toast {
  void showToat(String msf, {bool err = false}) async {
    await Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      msg: msf,
      timeInSecForIosWeb: 1,
      backgroundColor:err? ColorsApp.red: null,
    );
  }
}
