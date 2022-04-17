import 'package:mission_timer/core/helper/toast/toast.dart';

dynamic handleRepositoryCall(Future<dynamic> onRemote,
    {bool? noBody = false}) async {
  try {
    var reponse = await onRemote;
    if (reponse['code'] == 0) {
      throw reponse['msg'];
    }
    return noBody! ? reponse : reponse['data'];
  } catch (e) {
    Toast().showToat(e.toString(), err: true);
  }
}
