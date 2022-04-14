import 'package:gandalf/features/authentication/data/models/user_identity.dart';

abstract class UserDataSource {
  Future<UserIdentityModel> create({
    required String username,
    required String email,
    required String password,
  });
}
