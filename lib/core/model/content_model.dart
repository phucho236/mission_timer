import 'package:json_annotation/json_annotation.dart';
part 'content_model.g.dart';

@JsonSerializable()
class ContentModel {
  ContentModel({
    this.id,
    this.title,
  });
  @JsonKey(name: "_id")
  final String? id;
  final String? title;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ContentModelToJson(this);
}
