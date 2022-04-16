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
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'You need to provide a proper email or username for this field.';
                    return null;
                  }),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '******',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "You can't use a empty password.";
                  } else if (value.length < 6) {
                    return "The minimum length for the password is 6 characters.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ButtonLoadingIndicator(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // exerciseBloc.createExercise(_exerciseName);
                    // Navigator.pop(context);
                  }
                },
                child: Text('Login'),
              ),
              ButtonLoadingIndicator(
                onPressed: () {},
                child: Text('Crate account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
