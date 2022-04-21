import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/data/datasources/user_identity_data_source.dart';
import 'package:gandalf/features/authentication/data/models/user_identity.dart';
import 'package:gandalf/features/authentication/data/repositories/user_identity_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockUserIdentityDataSource extends Mock
    implements UserIdentityDataSource {}

void main() {
  MockUserIdentityDataSource? mockUserIdentityDataSource;
  UserIdentityRepositoryImpl? sut;

  setUp(() {
    mockUserIdentityDataSource = MockUserIdentityDataSource();
    sut = UserIdentityRepositoryImpl(mockUserIdentityDataSource!);
  });

  final tUsername = 'ednaldo-pereira';
  final tId = 'random-id';
  final tRoles = ['admin'];
  final tToken = 'random-token';

  final UserIdentityModel tUserIdentityModel = UserIdentityModel(
    username: tUsername,
    id: tId,
    roles: tRoles,
    token: tToken,
  );

  group('create', () {
    test('should create (persist) the user identity token information',
        () async {
      when(() => mockUserIdentityDataSource!.create(any()))
          .thenAnswer((_) async => null);
      final token = (await fixtureAsJson('token.json'))['token'];

      await sut!.create(token);

      verify(() => mockUserIdentityDataSource!.create(token)).called(1);
    });
  });

  group('fetch', () {
    test(
      'should be able to fetch persisted user identity data',
      () async {
        when(() => mockUserIdentityDataSource!.fetch())
            .thenAnswer((_) async => tUserIdentityModel);

        final result = await sut!.fetch();

        expect(result, Right(tUserIdentityModel));
      },
    );
  });
}
