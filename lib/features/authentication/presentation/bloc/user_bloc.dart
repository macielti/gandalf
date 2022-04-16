import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user.dart';

class UserBloc extends ChangeNotifier {
  UserBloc(this._createUserUsecase);

  final CreateUser _createUserUsecase;

  UserState _state = Empty();

  void createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    _state = Loading();
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
