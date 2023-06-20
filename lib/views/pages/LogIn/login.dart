import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain/TABcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/login-ctrl.dart';

class LoginPage extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());
  final tabController = Get.put(TabControllers());
  late SharedPreferences prefs ;
  final jwt = ''.obs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    jwt.value = prefs.getString('jwt') ?? '';
  }

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
              onPressed: ()  {
                // await loginCtrl.loginWithEmail();
                if (jwt != null) {
                  // Pengguna memiliki JWT, arahkan ke halaman "Home"
                  Get.offAllNamed(RouteNames.tabMain);
                  tabController.changeTab(2);
                } else {
                  // JWT masih null, lakukan pengalihan ke halaman lain
                  Get.offAllNamed(RouteNames.login);
                }


                // Lakukan proses login dengan email dan password yang diinputkan
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jika belum punya akun,'),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignUpPage()),
                    // );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

