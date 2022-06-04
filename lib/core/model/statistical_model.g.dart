// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistical_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticalModel _$StatisticalModelFromJson(Map<String, dynamic> json) =>
    StatisticalModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      sumTask: json['sumTask'] as int?,
      sumOfficeHours: json['sumOfficeHours'] as int?,
      countDone: json['countDone'] as int?,
      notAnswered: json['notAnswered'] as int?,
      countAccepted: json['countAccepted'] as int?,
      countRefuse: json['countRefuse'] as int?,
      countIncomplete: json['countIncomplete'] as int?,
    );

Map<String, dynamic> _$StatisticalModelToJson(StatisticalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sumTask': instance.sumTask,
      'sumOfficeHours': instance.sumOfficeHours,
      'countDone': instance.countDone,
      'notAnswered': instance.notAnswered,
      'countAccepted': instance.countAccepted,
      'countRefuse': instance.countRefuse,
      'countIncomplete': instance.countIncomplete,
    };
