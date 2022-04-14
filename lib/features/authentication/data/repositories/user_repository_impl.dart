import 'package:dartz/dartz.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/features/authentication/data/datasources/user_data_source.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<Either<Failure, UserIdentity>> create({
    required String username,
    required String password,
    required String email,
  }) async {
    final userIdentity = await dataSource.create(
        username: username, email: email, password: password);
    return Right(userIdentity);
  }
}
