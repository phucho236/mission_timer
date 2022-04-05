import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? name;
  final String? userId;
  final String? departmentId;
  final String? role;
  final String? email;
  final bool? isActive;
  final bool? isPasswordChanged;
  final String? phone;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? avatar;

  UserModel({
    this.id,
    this.name,
    this.userId,
    this.departmentId,
    this.role,
    this.email,
    this.isActive,
    this.isPasswordChanged,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.avatar,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
