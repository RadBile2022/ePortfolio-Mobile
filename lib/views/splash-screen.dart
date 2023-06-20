import 'package:eportfolio_mobile/views/pages/LogIn/login.dart';
import 'package:flutter/material.dart';

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
