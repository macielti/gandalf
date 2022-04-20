import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user_identity.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockUserIdentityRepository extends Mock
    implements UserIdentityRepository {}

void main() {
  MockUserIdentityRepository? mockUserIdentityRepository;
  CreateUserIdentity? sut;

  setUp(() {
    mockUserIdentityRepository = MockUserIdentityRepository();
    sut = CreateUserIdentity(mockUserIdentityRepository!);
  });

  test('should create (persist) the user identity token information', () async {
    when(() => mockUserIdentityRepository!.create(any()))
        .thenAnswer((_) async => Right(null));

    final token = (await fixtureAsJson('token.json'))['token'];
    final Params tParams = Params(token);

    await sut!(tParams);

    verify(() => mockUserIdentityRepository!.create(token)).called(1);
  });
}
