// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      quota: json['quota'] as String?,
      content: json['content'] == null
          ? null
          : ContentModel.fromJson(json['content'] as Map<String, dynamic>),
      year: json['year'] == null
          ? null
          : YearModel.fromJson(json['year'] as Map<String, dynamic>),
      type: json['type'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : ActionByModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] == null
          ? null
          : ActionByModel.fromJson(json['updatedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'quota': instance.quota,
      'content': instance.content,
      'year': instance.year,
      'type': instance.type,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };
