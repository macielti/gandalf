import 'package:dartz/dartz.dart';
import 'package:gandalf/core/error/failures.dart';

abstract class UserIdentityRepository {
  Future<Either<Failure, Null>> create(String token);
}
