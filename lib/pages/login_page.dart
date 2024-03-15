import 'package:complete_login_form/constant/const.dart';
import 'package:complete_login_form/service/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/text_field.dart';

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
  bool isObscureText = false;
  bool isChecked = false;

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
        child: ResponsiveBuilder(builder: (context, size) {
          return Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: size.screenSize.width,
                      height: size.screenSize.height * .25,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: primaryColor.withOpacity(.1),
                                offset: const Offset(3, 5),
                                blurRadius: 3,
                                spreadRadius: 5)
                          ],
                          color: primaryColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Text(
                        'IWACU',
                        style: TextStyle(
                            fontSize: 60.sp,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                            fontFamily: 'MadimiOne'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontSize: 25.sp, fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFieldWidget(
                        prefixIcon: const Icon(Icons.email_rounded),
                        controller: email,
                        hintText: 'Email',
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFieldWidget(
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: isObscureText,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        controller: password,
                        hintText: 'Password',
                        validator: (value) {
                          if (password.text.isEmpty) {
                            return 'Password should not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            checkColor: secondaryColor,
                            fillColor: MaterialStateColor.resolveWith((states) {
                              return isChecked ? primaryColor : secondaryColor;
                            }),
                          ),
                          Text(
                            'Remember Password',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: TextButton(
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/signup');
                                },
                                child: Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.sp,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600),
                                )),
                          )
                        ],
                      ),
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
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: size.screenSize.width,
                height: size.screenSize.height * .10,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: primaryColor.withOpacity(.1),
                          offset: const Offset(3, 5),
                          blurRadius: 3,
                          spreadRadius: 5)
                    ],
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
              ),
            ],
          );
        }),
      ),
    );
  }
}
