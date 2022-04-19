import 'package:json_annotation/json_annotation.dart';
part 'action_by_model.g.dart';

@JsonSerializable()
class ActionByModel {
  ActionByModel({
    this.id,
    this.name,
  });

  @JsonKey(name: "_id")
  final String? id;
  final String? name;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ActionByModel.fromJson(Map<String, dynamic> json) =>
      _$ActionByModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActionByModelToJson(this);
}
