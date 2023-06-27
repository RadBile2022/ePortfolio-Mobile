import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/add-post-page.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:eportfolio_mobile/views/pages/LogIn/login.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain/TABSmain.dart';
import 'package:eportfolio_mobile/views/splash-screen.dart';
import 'package:get/get.dart';

class PageRouteApp {
  static final pages = [
    GetPage(name: RouteNames.splash, page: ()=> SplashScreen()),
    GetPage(name: RouteNames.login, page: ()=>LoginPage()),

    GetPage(name: RouteNames.tabMain, page: ()=> TabsMain()),
    GetPage(name: RouteNames.home, page: ()=>  Home()),
    GetPage(name: RouteNames.addPost, page: ()=>  const AddPostPage()),



  ];
}

