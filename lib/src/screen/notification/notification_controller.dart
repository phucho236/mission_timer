import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/core/model/notification_model.dart';
import 'package:mission_timer/src/repositories/user/user_repository.dart';

class NotificationController extends GetxController {
  UserRepository _ur = UserRepository();
  bool isLoading = false;
  bool isLoadMore = false;
  ScrollController scrollController = ScrollController();
  List<NotificationModel> notis = [];
  int page = 1;
  bool isMax = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData(pageInput: 1);
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if ((maxScroll - currentScroll) < 200) {
        print((maxScroll - currentScroll) <= 200);

        if (!isLoadMore) {
          getData();
        }
      }
    });
  }

  void updateReaded(int index, String id) async {
    _ur.updateReadedNoti(id);
    notis[index].readed = true;
    update(["/notification"]);
  }

  void getData({int? pageInput}) async {
    if (pageInput != null) {
      isMax = false;
      notis = [];
    }

    if (!isMax) {
      if (pageInput != null) {
        page = pageInput;
      }

      if (pageInput != null) {
        isLoading = true;
        update(["/notification"]);
      } else {
        isLoadMore = true;
        update(["/loading"]);
      }

      List<NotificationModel> notistmp = await _ur.getNotifiCation(page: page);

      if (notistmp.isEmpty) {
        isMax = true;
      } else {
        notis.addAll(notistmp);
      }

      await Future.delayed(Duration(seconds: 1));
      if (pageInput != null) {
        isLoading = false;
      } else {
        isLoadMore = false;
      }
      update(["/notification"]);

      if (!isMax) {
        page = page++;
      }
    }
  }

//   List<NotificationModel> notisTmp = [
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: false,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     ),
//     NotificationModel(
//       type: "admin",
//       creater: 'admin',
//       title: 'Thông báo',
//       content: 'bạn có một lịch công tác mới',
//       readed: true,
//     )
//   ];
}
