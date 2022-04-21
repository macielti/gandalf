import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gandalf/core/config.dart';
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
  UserDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<UserIdentityModel> create({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${AppConfig.PORTEIRO_BASE_URL}/users');
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
