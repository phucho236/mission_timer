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
    this.idCreatedBy,
    this.createdAt,
    this.updatedAt,
    this.idUpdatedBy,
  });
  @JsonKey(name: "_id")
  final String? id;
  final String? title;
  final String? description;
  final String? quota;
  final String? content;
  final String? year;
  final String? type;
  @JsonKey(name: "createdBy")
  final String? idCreatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: "updatedBy")
  final String? idUpdatedBy;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
