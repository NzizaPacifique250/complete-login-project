// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:complete_login_form/constant/const.dart';

import 'package:complete_login_form/model/user.dart';
import 'package:complete_login_form/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/error_handling.dart';
import '../constant/utils.dart';

class AuthUser {
  //This is the sign up function
  void signupUser({
    required BuildContext context,
    required String password,
    required String email,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          email: email,
          name: name,
          password: password,
          address: 'Kigali',
          token: '',
          type: '');

      print(user.email);

      http.Response res = await http.post(Uri.parse("$uri/signup"),
          body: user.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });

      print(res.body);

      errorHandlingRequest(
          response: res,
          context: context,
          success: () {
            showingDialog(context,
                'Your account has been created you can now login using new credintials');
          });
    } catch (e) {
      print(e.toString());
      showingDialog(context, e.toString());
    }
  }

  // This is the sign in function

  void signinUser({
    required BuildContext context,
    required String password,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/login"),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });

      print(res.body);

      errorHandlingRequest(
          response: res,
          context: context,
          success: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);

            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamed(context, '/home');
          });
    } catch (e) {
      print(e.toString());
      showingDialog(context, e.toString());
    }
  }

  // This is get user function
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String? token = preferences.getString('x-auth-token');

      if (token == null) {
        preferences.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse('$uri/valid-token'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              "Content-Type": "application/json; charset=UTF-8",
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showingDialog(context, e.toString());
    }
  }
}
