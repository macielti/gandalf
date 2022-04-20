import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/presentation/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'features/authentication/presentation/bloc/user_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => di.sl<UserBloc>())],
      child: MaterialApp(
        title: 'Gandalf',
        theme: ThemeData(primaryColor: Colors.black),
        home: LoginPage(),
      ),
    ),
  );
}
