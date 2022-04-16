import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user.dart';

class UserBloc extends ChangeNotifier {
  UserBloc(this._createUserUsecase);

  final CreateUser _createUserUsecase;

  void createAccount({
    required String username,
    required String email,
    required String password,
  }) async {}
}
