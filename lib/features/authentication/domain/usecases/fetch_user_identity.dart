import 'package:dartz/dartz.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/core/usecases/usecase.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';

class FetchUserIdentity implements UseCase<UserIdentity?, NoParams> {
  FetchUserIdentity(this.repository);

  final UserIdentityRepository repository;

  @override
  Future<Either<Failure, UserIdentity?>> call(NoParams params) async {
    return await repository.fetch();
  }
}
