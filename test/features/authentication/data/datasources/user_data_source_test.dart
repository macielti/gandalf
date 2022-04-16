import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/data/datasources/user_data_source.dart';
import 'package:gandalf/features/authentication/data/models/user_identity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  MockClient? mockClient;
  UserDataSourceImpl? sut;

  setUp(() {
    mockClient = MockClient();
    sut = UserDataSourceImpl(mockClient!);
    registerFallbackValue(Uri());
  });

  group('create', () {
    final tUsername = 'ednaldo-pereira';
    final tEmail = 'ednaldo-pereira@example.com';
    final tPassword = 'random-password';

    final List<String> tRoles = [];
    final tId = 'd6976b27-244e-4493-92d3-672cb8588e65';

    test(
      'should request the user creation microservice endpoint returning a valid token',
      () async {
        when(() => mockClient!.post(any(),
                headers: any(named: 'headers'), body: any(named: 'body')))
            .thenAnswer((_) async => http.Response(fixture('token.json'), 201));
        final token = (await fixtureAsJson('token.json'))['token'];

        final result = await sut!
            .create(username: tUsername, email: tEmail, password: tPassword);

        expect(
            result,
            UserIdentityModel(
                id: tId, roles: tRoles, username: tUsername, token: token));

        verify(() => mockClient!.post(
              Uri.parse('http://172.18.0.8:8010/users/auth'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(
                <String, dynamic>{
                  'username': tUsername,
                  'email': tEmail,
                  'password': tPassword
                },
              ),
            )).called(1);
      },
    );
  });
}
