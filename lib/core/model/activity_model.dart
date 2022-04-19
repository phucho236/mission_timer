import 'package:json_annotation/json_annotation.dart';
import 'package:mission_timer/core/model/content_model.dart';
import 'package:mission_timer/core/model/action_by_model.dart';
import 'package:mission_timer/core/model/year_model.dart';
part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  ActivityModel({
    this.id,
    this.title,
    this.description,
    this.quota,
    this.content,
    this.year,
    this.type,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
  });
  @JsonKey(name: "_id")
  final String? id;
  final String? title;
  final String? description;
  final String? quota;
  final ContentModel? content;
  final YearModel? year;
  final String? type;
  final ActionByModel? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ActionByModel? updatedBy;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
