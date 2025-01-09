import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/auth/auth_entity.dart';
import '../../datasources/_mappers/entity_convertable.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable
    with EntityConvertible<UserModel, UserEntity> {
  final int? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? phone;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  final String? detail;
  @JsonKey(name: 'is_new')
  final bool? isNew;

  const UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.accessToken,
      this.refreshToken,
      this.detail,
      this.isNew});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  @override
  List<Object?> get props {
    return [id, firstName, lastName, phone, accessToken, refreshToken, detail, isNew];
  }

  @override
  UserEntity toEntity() => UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      accessToken: accessToken,
      refreshToken: refreshToken,
      detail: detail,
      isNew: isNew);
}
