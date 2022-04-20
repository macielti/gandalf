import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/core/usecases/usecase.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';

class CreateUserIdentity implements UseCase<Null, Params> {
  CreateUserIdentity(this.repository);

  final UserIdentityRepository repository;

  @override
  Future<Either<Failure, Null>> call(Params params) async {
    return await repository.create(params.token);
  }
}

class Params extends Equatable {
  Params(this.token);

  final String token;

  @override
  List<Object> get props => [token];
}
