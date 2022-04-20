import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserIdentityDataSource {
  Future<void> create(String token);
}

//TODO: write tests for that class
class UserIdentityDataSourceImpl implements UserIdentityDataSource {
  UserIdentityDataSourceImpl(this.storage);

  final FlutterSecureStorage storage;

  @override
  Future<void> create(String token) async {
    storage.write(key: 'token', value: token);
  }
}
