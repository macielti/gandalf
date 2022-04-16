import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/presentation/widgets/button_loading_indicator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          brightness: Brightness.dark,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username or Email',
                    hintText: 'example@example.com',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '******',
                  ),
                  obscureText: true,
                ),
                ButtonLoadingIndicator(
                  onPressed: () {},
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ));
  }
}
