import 'package:flutter_test/flutter_test.dart';
import 'package:gandalf/features/authentication/data/models/user_identity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final String tId = 'd6976b27-244e-4493-92d3-672cb8588e65';
  final List<String> tRoles = [];
  final String tUsername = 'ednaldo-pereira';

  group('fromJWToken', () {
    test('should return a valid model', () async {
      final Map<String, dynamic> jsonMap = await fixtureAsJson('token.json');
      final UserIdentityModel tUserIdentityModel = UserIdentityModel(
          id: tId, roles: tRoles, username: tUsername, token: jsonMap['token']);

      final result = UserIdentityModel.fromJWToken(jsonMap['token']);

      expect(result, tUserIdentityModel);
    });
  });
}
