import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user_identity.dart';
import 'package:gandalf/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/authentication/domain/usecases/create_user.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // --Blocs
  sl.registerFactory(() => UserBloc(sl()));
  // --Use cases
  sl.registerLazySingleton(() => CreateUserIdentity(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  // --Repositories
  sl.registerLazySingleton<UserIdentityRepository>(() => null);
}
