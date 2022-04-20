import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/data/datasources/user_identity_data_source.dart';
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
}
