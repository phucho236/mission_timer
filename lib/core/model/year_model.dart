import 'package:json_annotation/json_annotation.dart';
part 'year_model.g.dart';

@JsonSerializable()
class YearModel {
  YearModel({
    this.id,
    this.name,
  });
  @JsonKey(name: "_id")
  final String? id;
  final String? name;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory YearModel.fromJson(Map<String, dynamic> json) =>
      _$YearModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$YearModelToJson(this);
}
