import 'dart:convert';

import 'package:complete_login_form/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void errorHandlingRequest(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback success}) {
  switch (response.statusCode) {
    case 200:
      success();
      break;
    case 400:
      showingDialog(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showingDialog(context, jsonDecode(response.body)['error']);
      break;
    default:
      showingDialog(context, response.body);
  }
}
