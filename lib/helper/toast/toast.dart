import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  void showToat(String msf) async {
    await Fluttertoast.showToast(
      msg: msf,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }
}
