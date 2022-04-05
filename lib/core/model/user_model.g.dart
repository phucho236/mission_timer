// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      departmentId: json['departmentId'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      isActive: json['isActive'] as bool?,
      isPasswordChanged: json['isPasswordChanged'] as bool?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'departmentId': instance.departmentId,
      'role': instance.role,
      'email': instance.email,
      'isActive': instance.isActive,
      'isPasswordChanged': instance.isPasswordChanged,
      'phone': instance.phone,
      'address': instance.address,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'avatar': instance.avatar,
    };
