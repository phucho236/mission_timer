import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  NotificationModel(
      {this.id,
      this.type,
      this.title,
      this.content,
      this.creater,
      this.readed});
  @JsonKey(name: "_id")
  final String? id;
  final String? title;
  final String? content;
  final String? type;
  final String? creater;
  @JsonKey(name: "seen")
   bool? readed;
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
