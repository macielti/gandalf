import 'dart:convert';

import 'package:gandalf/features/authentication/data/models/user_identity.dart';
import 'package:http/http.dart' as http;

abstract class UserDataSource {
  Future<UserIdentityModel> create({
    required String username,
    required String email,
    required String password,
  });
}

class UserDataSourceImpl implements UserDataSource {
  final http.Client client =
      http.Client(); // receive it through dependency injection

  @override
  Future<UserIdentityModel> create({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://172.18.0.8:8010/users/auth');
    final response = await client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          'email': email,
          'password': password
        },
      ),
    );
    final jsonBody = jsonDecode(response.body);
    return UserIdentityModel.fromJWToken(jsonBody['token']);
  }
}
