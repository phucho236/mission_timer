import 'package:mission_timer/core/model/activity_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

class MergeTaskModel {
  MergeTaskModel({this.date, this.taskmodels});
  final DateTime? date;
  final List<TaskModel>? taskmodels;
}

@JsonSerializable()
class TaskModel {
  TaskModel({
    this.id,
    this.task,
    this.status,
    this.isApprove,
    this.image,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isExpanded = false,
  });
  @JsonKey(name: "_id")
  final String? id;
  final Task? task;
  final String? status;
  final bool? isApprove;
  final String? image;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool isExpanded;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}

@JsonSerializable()
class Task {
  Task({
    this.id,
    this.activity,
    this.description,
    this.startDate,
    this.endDate,
    this.officeHours,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
  });
  @JsonKey(name: "_id")
  final String? id;
  final ActivityModel? activity;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? officeHours;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? updatedBy;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
