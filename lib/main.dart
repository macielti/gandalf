import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/presentation/pages/login_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gandalf',
    theme: ThemeData(primaryColor: Colors.black),
    home: LoginPage(),
  ));
}
