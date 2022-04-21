import 'package:dartz/dartz.dart';
import 'package:gandalf/core/error/failures.dart';
import 'package:gandalf/features/authentication/data/datasources/user_identity_data_source.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';

class UserIdentityRepositoryImpl implements UserIdentityRepository {
  UserIdentityRepositoryImpl(this.dataSource);

  final UserIdentityDataSource dataSource;

  @override
  Future<Either<Failure, Null>> create(String token) async {
    await dataSource.create(token);
    return Right(null);
  }

  //TODO: write tests for that method
  @override
  Future<Either<Failure, UserIdentity?>> fetch() async {
    return Right(await dataSource.fetch());
  }
}
