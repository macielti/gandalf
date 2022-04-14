import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_repository.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  MockUserRepository? mockRepository;
  CreateUser? sut;

  setUp(() {
    mockRepository = MockUserRepository();
    sut = CreateUser(mockRepository!);
  });

  final tUsername = 'ednaldo-pereira';
  final tEmail = 'ednaldo-pereira@example.com';
  final tPassword = 'random-password';
  final tId = 'random-id';

  final tUserIdentity = UserIdentity(
      id: tId, roles: ['customer'], username: tUsername, token: 'random-token');

  final tParams =
      Params(username: tUsername, email: tEmail, password: tPassword);

  test(
    'should create a new user',
    () async {
      when(() => mockRepository!.create(
              username: any(named: 'username'),
              password: any(named: 'password'),
              email: any(named: 'email')))
          .thenAnswer((_) async => Right(tUserIdentity));

      final result = await sut!(tParams);

      expect(result, Right(tUserIdentity));
      verify(() => mockRepository!.create(
          username: tUsername, email: tEmail, password: tPassword)).called(1);
    },
  );
}
