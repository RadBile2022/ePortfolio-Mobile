import 'package:eportfolio_mobile/controllers/auth.dart';
import 'package:eportfolio_mobile/routes/route_pages.dart';
import 'package:eportfolio_mobile/views/login.dart';
import 'package:eportfolio_mobile/views/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      getPages: PageRouteApp.pages,
    );
  }
}



