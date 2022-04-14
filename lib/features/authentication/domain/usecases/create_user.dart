import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/core/usecases/usecase.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_repository.dart';

class CreateUser implements UseCase<UserIdentity, Params> {
  CreateUser(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, UserIdentity>> call(Params params) async {
    return await repository.create(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String username;
  final String password;
  final String email;

  Params({required this.username, required this.email, required this.password});

  @override
  List<Object> get props => [username, email, password];
}
