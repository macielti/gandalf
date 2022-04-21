import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/core/usecases/usecase.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';
import 'package:gandalf/features/authentication/domain/usecases/fetch_user_identity.dart';
import 'package:mocktail/mocktail.dart';

class MockUserIdentityRepository extends Mock
    implements UserIdentityRepository {}

void main() {
  MockUserIdentityRepository? mockUserIdentityRepository;
  FetchUserIdentity? sut;

  setUp(() {
    mockUserIdentityRepository = MockUserIdentityRepository();
    sut = FetchUserIdentity(mockUserIdentityRepository!);
  });

  final tUsername = 'ednaldo-pereira';
  final tId = 'random-id';

  final tUserIdentity = UserIdentity(
      id: tId, roles: ['customer'], username: tUsername, token: 'random-token');

  final tNoParams = NoParams();

  test('should retrieve the persisted user identity data', () async {
    when(() => mockUserIdentityRepository!.fetch())
        .thenAnswer((_) async => Right(tUserIdentity));

    final result = await sut!(tNoParams);

    expect(result, Right(tUserIdentity));
    verify(() => mockUserIdentityRepository!.fetch()).called(1);
  });
}
