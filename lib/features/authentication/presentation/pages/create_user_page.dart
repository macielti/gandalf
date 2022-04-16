import 'package:flutter/material.dart';
import 'package:gandalf/features/authentication/presentation/widgets/button_loading_indicator.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final formKey = GlobalKey<FormState>();

  late String _username;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
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
                  labelText: 'Username',
                  hintText: 'ednaldo-pereira',
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'You need to provide a proper username for this field.';
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'ednaldo-pereira@example.com',
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'You need to provide a proper email for this field.';
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
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
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 10),
              ButtonLoadingIndicator(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // exerciseBloc.createExercise(_exerciseName);
                    Navigator.pop(context);
                  }
                },
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
