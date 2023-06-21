
import 'package:eportfolio_mobile/views/pages/LogIn/LogInCtrl.dart';
import 'package:eportfolio_mobile/views/pages/LogIn/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  void maisn() async{
    String references = 'https://www.appsloveworld.com/sample-rest-api-url-for-testing-with-authentication';
    LoginController loginController = Get.put(LoginController());

    loginController.emailController.text = 'Developer5@gmail.com';
    loginController.passwordController.text = '123456';
    loginController.loginWithEmail();
  // loginController.serviceGetUser();



    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    final data = prefs.getString('data') ?? 'null';
    final token = prefs.getString('token') ?? 'null';
    print('hallo dek');
    print(data);
    print(token);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/logo-gft.jpg'),
            ),
            Center(
              child: Text(
                'Flutter Foundation',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white, // Warna teks pada splash screen
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
