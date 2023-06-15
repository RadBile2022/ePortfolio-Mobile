import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  Future <void> registerWithEmail () async {
    try {
      var url = Uri.parse(Endpoint.login);
      Map body = {
        'name' : nameController.text,
        'email' : emailController.text.trim(),
        'password' : passwordController.text
      };
      var headers ={'Content-Type' : 'application/json'};

      final request =await post(url, body: jsonEncode(body),headers: headers);
      if (request.statusCode == 200){
        final json = jsonDecode(request.body);
        if(json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
        } else{
          throw jsonDecode(request.body)['Message'] ?? 'Unknown Error Occurred';

        }
      } else{
        throw jsonDecode(request.body)['Message'] ?? 'Unknown Error Occurred';

      }
    }catch (e){
      Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(e.toString())],
        );
      });
    }
  }
}