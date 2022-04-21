import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gandalf/features/authentication/data/models/user_identity.dart';

abstract class UserIdentityDataSource {
  Future<void> create(String token);

  Future<UserIdentityModel> fetch();
}

class UserIdentityDataSourceImpl implements UserIdentityDataSource {
  UserIdentityDataSourceImpl(this.storage);

  final FlutterSecureStorage storage;

  @override
  Future<void> create(String token) async {
    storage.write(key: 'token', value: token);
  }

  //TODO: write tests for that method
  @override
  Future<UserIdentityModel> fetch() async {
    final String? token = await storage.read(key: 'token');
    return UserIdentityModel.fromJWToken(token!);
  }
}
