import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/data/datasources/user_data_source.dart';
import 'package:gandalf/features/authentication/data/models/user_identity.dart';
import 'package:gandalf/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDataSource extends Mock implements UserDataSource {}

void main() {
  MockUserDataSource? mockDataSource;
  UserRepositoryImpl? sut;

  setUp(() {
    mockDataSource = MockUserDataSource();
    sut = UserRepositoryImpl(mockDataSource!);
  });

  final tUsername = 'ednaldo-pereira';
  final tPassword = 'random-password';
  final tEmail = 'ednaldo-pereira@example.com';

  final UserIdentityModel tUserIdentityModel = UserIdentityModel(
    username: tUsername,
    id: 'random-id',
    roles: ['admin'],
    token: 'random-token',
  );

  group('create', () {
    test(
      'should insert a new user on microservice database',
      () async {
        when(() => mockDataSource!.create(
              username: any(named: 'username'),
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserIdentityModel);

        final result = await sut!
            .create(username: tUsername, password: tPassword, email: tEmail);

        expect(result, Right(tUserIdentityModel));
        verify(() => mockDataSource!.create(
              username: tUsername,
              email: tEmail,
              password: tPassword,
            )).called(1);
      },
    );
  });
}
