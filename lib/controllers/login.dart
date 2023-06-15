import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences prefs;

  final jwt = ''.obs;
  final userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    jwt.value = prefs.getString('jwt') ?? '';
    userId.value = prefs.getString('userId') ?? '';
  }

  Future<void> loginWithEmail() async {
    var url = Uri.parse(Endpoint.login);
    Map<String, dynamic> body = {
      'email': emailController.text.trim(),
      'password': passwordController.text
    };
    var headers = {'Content-Type': 'application/json'};

    final response = await post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      jwt.value = jsonResponse['jwt'];
      userId.value = jsonResponse['userId'];
      prefs.setString('jwt', jwt.value);
      prefs.setString('userId', userId.value);
    }
  }
}

