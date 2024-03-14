import 'package:complete_login_form/service/auth_user.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthUser user = AuthUser();
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void signinUser() {
    user.signinUser(
      context: context,
      password: password.text,
      email: email.text,
    );
  }

  @override
  void initState() {
    user.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Login form'),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  const Text('Email: '),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value!)) {
                          return "Please check your email address";
                        }
                        if (email.text.isEmpty) {
                          return 'Email should not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  const Text('Password: '),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (password.text.isEmpty) {
                          return 'Password should not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text('Have no account'),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('Sign up'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) signinUser();
                },
                child: const Text('Log in')),
          ],
        ),
      ),
    );
  }
}
