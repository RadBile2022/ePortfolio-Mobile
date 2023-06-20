import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:eportfolio_mobile/views/pages/LogIn/login.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain/TABSmain.dart';
import 'package:eportfolio_mobile/views/splash-screen.dart';
import 'package:get/get.dart';

class PageRouteApp {
  static final pages = [
    GetPage(name: RouteNames.splash, page: ()=> SplashScreen()),
    GetPage(name: Endpoint.login, page: ()=>LoginPage()),

    GetPage(name: RouteNames.tabMain, page: ()=> TabsMain()),
    GetPage(name: RouteNames.home, page: ()=>  Home()),


  ];
}

