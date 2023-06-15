import 'dart:convert';

import 'package:eportfolio_mobile/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/api/endpoint.dart';
import '../../controllers/login.dart';

class LoginPage extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: loginCtrl.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: loginCtrl.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {

              loginCtrl.loginWithEmail();
              print(loginCtrl.userId);
// wahradar511@gmail.com
    // final response = await post(Uri.parse(Endpoint.login),
    //     headers: {"Content-Type": "application/json"},
    //     body: jsonEncode(requestBody));
    //
    // if (response.statusCode != 200) {
    //   var data = json.decode(response.body);
    //   if (data == 'Wrong Password'){
    //     wrongpass = true;
    //   } else if (data == 'User not Found'){
    //     notfound = true;
    //   }
    // } else {
    //   var data = json.decode(response.body);
    // print(data);
    // Auth.fromJson(data);
    //
    // }
                // Lakukan proses login dengan email dan password yang diinputkan
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
