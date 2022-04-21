import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user.dart'
    as create_user;
import 'package:gandalf/features/authentication/domain/usecases/create_user_identity.dart'
    as create_user_identity;

class UserBloc extends ChangeNotifier {
  UserBloc({
    required this.createUserUsecase,
    required this.createUserIdentityUsecase,
  });

  final create_user.CreateUser createUserUsecase;
  final create_user_identity.CreateUserIdentity createUserIdentityUsecase;

  UserState _state = Empty();

  late UserIdentity _userIdentity;

  void createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    _state = Loading();
    notifyListeners();
    final params = create_user.Params(
        username: username, email: email, password: password);
    _userIdentity = (await createUserUsecase(params)) as UserIdentity;
    final userIdentityParams = create_user_identity.Params(_userIdentity.token);
    await createUserIdentityUsecase(userIdentityParams);
    _state = Loaded();
    notifyListeners();
  }

  void fetchUserIdentity() {}
}

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends UserState {}

class Loading extends UserState {}

class Loaded extends UserState {}
