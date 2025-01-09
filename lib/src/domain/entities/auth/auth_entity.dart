import 'dart:ffi';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? accessToken;
  final String? refreshToken;
  final String? detail;
  final bool? isNew;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.accessToken,
    this.refreshToken,
    this.detail,
    this.isNew,
  });

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      phone,
      accessToken,
      refreshToken,
      detail,
      isNew
    ];
  }

}
