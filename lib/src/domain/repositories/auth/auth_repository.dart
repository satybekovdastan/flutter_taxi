import 'package:fpdart/fpdart.dart';
import 'package:merphy/src/domain/entities/auth/auth_entity.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

import '../../../core/exceptions/network/network_exception.dart';

abstract class AuthRepository {
  /// Retrieves the detailed information of an actor.
  Future<Either<NetworkException, UserEntity>> loginSendCode({required String phone});

  Future<Either<NetworkException, UserEntity>> verifyCode({required String phone, required String code});

/// Retrieves the social media information of an actor.
// Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId});
}
