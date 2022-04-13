import 'package:dartz/dartz.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserIdentity>> create({
    required String username,
    required String password,
    required String email,
  });
}
