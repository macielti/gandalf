import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gandalf/features/authentication/data/datasources/user_data_source.dart';
import 'package:gandalf/features/authentication/data/datasources/user_identity_data_source.dart';
import 'package:gandalf/features/authentication/data/repositories/user_identity_repository_impl.dart';
import 'package:gandalf/features/authentication/domain/repositories/user_identity_repository.dart';
import 'package:gandalf/features/authentication/domain/usecases/create_user_identity.dart';
import 'package:gandalf/features/authentication/domain/usecases/fetch_user_identity.dart';
import 'package:gandalf/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'features/authentication/data/repositories/user_repository_impl.dart';
import 'features/authentication/domain/repositories/user_repository.dart';
import 'features/authentication/domain/usecases/create_user.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // --Blocs
  sl.registerFactory(() => UserBloc(
        createUserUsecase: sl(),
        createUserIdentityUsecase: sl(),
        fetchUserIdentityUsecase: sl(),
      ));

  // --Use cases
  sl.registerLazySingleton(() => CreateUserIdentity(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => FetchUserIdentity(sl()));

  // --Repositories
  sl.registerLazySingleton<UserIdentityRepository>(
      () => UserIdentityRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // --Data sources
  sl.registerLazySingleton<UserIdentityDataSource>(
      () => UserIdentityDataSourceImpl(sl()));
  sl.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl(sl()));

  // --External
  sl.registerFactory(() => http.Client());
  sl.registerFactory(() => FlutterSecureStorage());
}
