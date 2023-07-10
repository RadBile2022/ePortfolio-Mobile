import 'package:eportfolio_mobile/views/pages/AboutMe/about-me-tab-page.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticleController.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/get-articles-page.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPostController.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/get-posts-page.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILECtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> myTabs = [
    Tab(text: 'About Me'),
    Tab(text: 'Posts'),
    Tab(text: 'Articles'),
    Tab(text: 'Activities'),
    Tab(text: 'Projects'),
    Tab(text: 'Badges'),
    Tab(text: 'Album'),
  ];

  List<Widget> myTabViews = [
    Center(
      child: GetBuilder<CurrentUserController>(
        builder: (controller) {
          return AboutMeTabPage(
            user: controller.currentUser.value,
          );
        },
      ),
    ),
    Center(
      child: GetBuilder<PostController>(
        builder: (controller) {
          return PostsTabPage(
            postUser: controller.userController.currentUser.value,
            postAll: controller.postList,
          );
        },
      ),
    ),
    Center(
      child: GetBuilder<ArticleController>(
        builder: (controller) {
          return ArticlesTabPage(
            // currentUser: currentUserControl.currentUser.value,
            // currentUser: controller.userController.currentUser.value,
            articleUser: controller.userController.currentUser.value,
            articleAll: controller.articleList,
          );
        },
      ),
    ),
    Center(
      child: Text('Hello Dek'),
    ),
    Center(
      child: Text('Hello Dek'),
    ),
    Center(
      child: Text('Hello Dek'),
    ),
    Center(
      child: Text('Hello Dek'),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}


class Block {
  final String title;
  final String desc;
  final bool about;

  Block({required this.title, required this.desc, this.about = false});
}

class dummy {
  // final bool userData = true; // Dummy data, ganti dengan data sesungguhnya
  // final String name = "John Does"; // Dummy data, ganti dengan data sesungguhnya
  // final String role = "mahasiswa"; // Dummy data, ganti dengan data sesungguhnya
  // final String nim = "123456789"; // Dummy data, ganti dengan data sesungguhnya
  // final String major =
  //     "Computer Science"; // Dummy data, ganti dengan data sesungguhnya
  // final String academicField =
  //     "Information Technology"; // Dummy data, ganti dengan data sesungguhnya
  // final String organization =
  //     "ABC Organization"; // Dummy data, ganti dengan data sesungguhnya
  // final String city = "New York"; // Dummy data, ganti dengan data sesungguhnya
  // final String dateBirth =
  //     "1990-01-01"; // Dummy data, ganti dengan data sesungguhnya
  // final String gender = "male"; // Dummy data, ganti dengan data sesungguhnya
  static String _markdownAbout = '''
    Saya (Radar) adalah 
### Lulusan Terbaik Prodi Pendidikan Agama Islam UIN Sayyid Ali Rahmatullah Tulungagung 
dengan 
## Indeks Prestasi Komulatif (IPK) 3.95/4.00 tahun 2022

saya sangat menyukai dunia pemrograman karena pertama kali belajar pemrograman di 
### GFT ACADEMY mengajarkan Fast Track yang tidak pernah diajarkan di tempat lain

    ''';

  String? linkedin = 'dfkjdsf';
  String? github;
  String? ig = 'df';
  String? facebook = 'dsgf';
  String? twitter;
  String _titleCardSocmed = 'Social Media';

  final List<String> skills = [
    'Flutter',
    'Dart',
    'UI Design',
    'Firebase',
    'API Integration',
  ];

  final List<Block> blocks = [
    Block(
      title: "Block 1",
      desc: "Description for Block 1",
      about: true,
    ),
    Block(
      title: "Block 2",
      desc: "Description for Block 2",
      about: false,
    ),
    Block(
      title: "Block 3",
      desc: "Description for Block 3",
      about: true,
    ),
  ];
}
