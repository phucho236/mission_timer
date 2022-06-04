import 'package:json_annotation/json_annotation.dart';
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
  final String? content;
  final String? year;
  final String? type;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? updatedBy;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
