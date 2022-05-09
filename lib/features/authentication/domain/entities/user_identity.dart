import 'package:equatable/equatable.dart';

class UserIdentity extends Equatable {
  UserIdentity({
    required this.id,
    required this.roles,
    required this.username,
    required this.token,
  });

  final String id;
  final List<String> roles;
  final String username;
  final String token;

  @override
  List<Object?> get props => [id, roles, username, token];
}
