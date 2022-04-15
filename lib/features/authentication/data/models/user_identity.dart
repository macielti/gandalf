import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserIdentityModel extends UserIdentity {
  UserIdentityModel({
    required String id,
    required List<String> roles,
    required String username,
    required String token,
  }) : super(id: id, username: username, roles: roles, token: token);

  factory UserIdentityModel.fromJWToken(String jwToken) {
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(
        jwToken); // maybe make JwtDecoder be fetched by dependency injection (more easy to test the class)
    final Map<String, dynamic> userData = decodedToken['user'];
    return UserIdentityModel(
        id: userData['id'],
        roles: userData['roles'].cast<String>(),
        // maybe convert the roles values to uppercase
        username: userData['username'],
        token: jwToken);
  }
}
