import 'package:complete_login_form/service/auth_user.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthUser user = AuthUser();
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void signupUser() {
    user.signupUser(
        context: context,
        password: password.text,
        email: email.text,
        name: name.text);
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
                  const Text('Name: '),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextFormField(
                      controller: name,
                      //  validator : (value) {
                      //     if (name.text.isEmpty) {
                      //       return 'Name should not be empty';
                      //     }
                      //     return null;
                      //   },
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
                Text('Already have an account'),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Log in'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) signupUser();
                },
                child: const Text('Sign up')),
          ],
        ),
      ),
    );
  }
}
