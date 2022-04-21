import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/data/datasources/user_identity_data_source.dart';
import 'package:gandalf/features/authentication/data/models/user_identity.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  MockFlutterSecureStorage? mockFlutterSecureStorage;
  UserIdentityDataSourceImpl? sut;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    sut = UserIdentityDataSourceImpl(mockFlutterSecureStorage!);
  });

  final tUsername = 'ednaldo-pereira';
  final tEmail = 'ednaldo-pereira@example.com';
  final tPassword = 'random-password';

  final List<String> tRoles = [];
  final tId = 'd6976b27-244e-4493-92d3-672cb8588e65';

  group('create', () {
    test('should persist token on flutter secure storage', () async {
      when(() => mockFlutterSecureStorage!.write(
          key: any(named: 'key'),
          value: any(named: 'value'))).thenAnswer((_) async => null);
      final token = (await fixtureAsJson('token.json'))['token'];

      await sut!.create(token);

      verify(() => mockFlutterSecureStorage!.write(key: 'token', value: token))
          .called(1);
    });
  });

  group('fetch', () {
    test('should be able to fetch persisted user identity data', () async {
      final token = (await fixtureAsJson('token.json'))['token'];
      when(() => mockFlutterSecureStorage!.read(key: any(named: 'key')))
          .thenAnswer((_) async => token);

      final result = await sut!.fetch();

      expect(
        result,
        UserIdentityModel(
          id: tId,
          roles: tRoles,
          username: tUsername,
          token: token,
        ),
      );

      verify(() => mockFlutterSecureStorage!.read(key: 'token')).called(1);
    });
  });
}
