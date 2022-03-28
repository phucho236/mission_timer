import 'package:mission_timer/core/helper/toast/toast.dart';

dynamic handleRepositoryCall(Future<dynamic> onRemote) async {
  try {
    return await onRemote;
  } catch (e) {
    Toast().showToat(e.toString(),err:true);
  }
}
