import 'package:json_annotation/json_annotation.dart';
part 'statistical_model.g.dart';

@JsonSerializable()
class StatisticalModel {
  StatisticalModel({
    this.id,
    this.name,
    this.sumTask,
    this.sumOfficeHours,
    this.countDone,
    this.notAnswered,
    this.countAccepted,
    this.countRefuse,
    this.countIncomplete,
  });

  final String? id;
  final String? name;
  final int? sumTask;
  final int? sumOfficeHours;
  final int? countDone;
  final int? notAnswered;
  final int? countAccepted;
  final int? countRefuse;
  final int? countIncomplete;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory StatisticalModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticalModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StatisticalModelToJson(this);
}
