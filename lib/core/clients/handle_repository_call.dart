import 'dart:developer';

import 'package:mission_timer/core/helper/toast/toast.dart';

dynamic handleRepositoryCall(Future<dynamic> onRemote,
    {bool? noBody = false}) async {
  try {
    var result = await onRemote;
    if (result['code'] == 0) {
      throw result['msg'];
    }
    return noBody! ? result : result['data'];
  } catch (e) {
    log(e.toString());
    Toast().showToat(e.toString(), err: true);
  }
}
