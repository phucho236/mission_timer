import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notis = [
    NotificationModel(
      type: "admin",
      creater: 'admin',
      title: 'Thông báo',
      content: 'bạn có một lịch công tác mới',
      readed: true,
    ),
    NotificationModel(
      type: "admin",
      creater: 'admin',
      title: 'Thông báo',
      content: 'bạn có một lịch công tác mới',
      readed: true,
    ),
    NotificationModel(
      type: "admin",
      creater: 'admin',
      title: 'Thông báo',
      content: 'bạn có một lịch công tác mới',
      readed: false,
    ),
    NotificationModel(
      type: "admin",
      creater: 'admin',
      title: 'Thông báo',
      content: 'bạn có một lịch công tác mới',
      readed: true,
    )
  ];
}

class NotificationModel {
  NotificationModel(
      {this.type, this.title, this.content, this.creater, this.readed});
  final String? type;
  final String? title;
  final String? content;
  final String? creater;
  final bool? readed;
}
