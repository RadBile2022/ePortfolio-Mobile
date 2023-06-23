import 'package:eportfolio_mobile/controllers/auth.dart';
import 'package:eportfolio_mobile/routes/route_pages.dart';
import 'package:eportfolio_mobile/views/login.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/get-posts-page.dart';
import 'package:eportfolio_mobile/views/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => GetPostsController());
  runApp(MyApp());
}

void dummyTest() async {
  GetPostsController a = Get.put(GetPostsController());

  await a.readData();
  print(a.getPostsList);

  // 2 debug, object dan array
  // a.getPostsService();
//   for (GetPosts g in a.getPostsList){
//
//   }
//   a.getPostsList.listen((p0) {
//     print(p0);
//   });
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
