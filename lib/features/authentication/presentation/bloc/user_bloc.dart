import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gandalf/core/usecases/usecase.dart';
import 'package:gandalf/features/authentication/domain/entities/user_identity.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user.dart'
    as create_user;
import 'package:gandalf/features/authentication/domain/usecases/create_user_identity.dart'
    as create_user_identity;
import 'package:gandalf/features/authentication/domain/usecases/fetch_user_identity.dart'
    as fetch_user_identity;

class UserBloc extends ChangeNotifier {
  UserBloc({
    required this.createUserUsecase,
    required this.createUserIdentityUsecase,
    required this.fetchUserIdentityUsecase,
  }) {
    fetchUserIdentity();
  }

  final create_user.CreateUser createUserUsecase;
  final create_user_identity.CreateUserIdentity createUserIdentityUsecase;
  final fetch_user_identity.FetchUserIdentity fetchUserIdentityUsecase;

  UserState _state = Empty();

  late UserIdentity? _userIdentity;

  UserState get state => _state;

  UserIdentity? get exercises => _userIdentity;

  Future<UserIdentity?> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    _state = Loading();
    notifyListeners();
    final params = create_user.Params(
        username: username, email: email, password: password);
    _userIdentity = (await createUserUsecase(params)) as UserIdentity;
    final userIdentityParams =
        create_user_identity.Params(_userIdentity!.token);
    await createUserIdentityUsecase(userIdentityParams);
    _state = Loaded();
    notifyListeners();
    return _userIdentity;
  }

  void fetchUserIdentity() async {
    _state = Loading();
    notifyListeners();
    final noParams = NoParams();
    _userIdentity = (await fetchUserIdentityUsecase(noParams))
        .fold((failure) => null, (userIdentity) => userIdentity);
    _state = Loaded();
    notifyListeners();
  }
}

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends UserState {}

class Loading extends UserState {}

class Loaded extends UserState {}
