import 'package:dartz/dartz.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';

abstract class UserIdentityRepository {
  Future<Either<Failure, Null>> create(String token);

  Future<Either<Failure, UserIdentity>> fetch();
}
