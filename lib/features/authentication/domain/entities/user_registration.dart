import 'package:equatable/equatable.dart';

class UserRegistration extends Equatable {
  UserRegistration({
    required this.username,
    required this.password,
    required this.email,
  });

  final String username;
  final String password;
  final String email;

  @override
  List<Object?> get props => [username, password, email];
}

//Maybe this class should be only a model instead of also an entity
