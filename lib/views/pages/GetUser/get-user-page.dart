import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/components/profile_bar.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetxArticleController.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/get-articles-page.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetxPostController.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/get-posts-page.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
          return AboutMeTab(
            currentUser: controller.currentUser.value,
          );
        },
      ),
    ),
    Center(
      child: GetBuilder<PostController>(
        builder: (controller) {
          return PostsTab(
            postUser: controller.userController.currentUser.value,
            postAll: controller.postList,
          );
        },
      ),
    ),
    Center(
      child: GetBuilder<ArticleController>(
        builder: (controller) {
          return ArticlesTab(
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

class ProfilePage extends StatelessWidget {
  final profilePageController = Get.find<ProfilePageController>();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Function(String) $onTapMoreHoriz = (String id) {};
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [

            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: GetBuilder<CurrentUserController>(
                  builder: (controller) {
                    final GetUser currentUser = controller.currentUser.value;

                    return Profile_Bar(
                      profilePicture: currentUser.profilePicture,
                      name: currentUser.username,
                      role: currentUser.role,
                      major: currentUser.major,
                      nim: currentUser.nim,
                      interest: currentUser.interest,
                      academicField: currentUser.academicField,
                      following: currentUser.followings,
                      followers: currentUser.followers,
                    );
                  },
                ),
              ),
              expandedHeight: 350,
              backgroundColor: Colors.white,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2),
                child:
                Column(
    children: [

      TabBar(
          tabs: profilePageController.myTabs,
          controller: profilePageController.tabController,
          labelColor: Colors.black,
          isScrollable: true,
      ),
    ],
    )

              ),
            ),
          ],
          body:


          TabBarView(
            controller: profilePageController.tabController,
            children: profilePageController.myTabViews,
          ),
        ));
  }
}

class AboutMeTab extends StatelessWidget {
  final GetUser currentUser;

  AboutMeTab({super.key, required this.currentUser});

  /// PERSONAL INFORMATION
  final String _titleCardPersonal = 'Personal Information';
  final VoidCallback _$editCardPersonal = () {
    print('Tapped!');
  };

  Column __descCardPersonal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name: ${currentUser.username}"),
        if (currentUser.role == "mahasiswa")
          Text("Student ID: ${currentUser.nim ?? ""}"),
        if (currentUser.role == "mahasiswa")
          Text("Major: ${currentUser.major ?? ""}"),
        if (currentUser.role != "mahasiswa")
          Text("Academic Field: ${currentUser.academicField ?? ""}"),
        Text("Organization: ${currentUser.organization ?? ""}"),
        Text("City: ${currentUser.city ?? ""}"),
        Text("Date Of Birth: ${currentUser.dateBirth ?? ""}"),
        Text("Gender: ${currentUser.gender ?? ""}"),
        Text("Role: ${currentUser.role ?? ""}"),
      ],
    );
  }

  /// ABOUT
  final String _titleCardAbout = 'About';
  final VoidCallback _$editCardAbout = () {
    // Kode untuk menangani aksi tap
    print('Tapped!');
  };

  Markdown __descCardAbout() {
    return Markdown(
      shrinkWrap: true,
      selectable: true,
      data: currentUser.about,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  /// SOCMED
  final String _titleCardSocmed = 'Skills';
  final VoidCallback _$editCardSocmed = () {
    // Kode untuk menangani aksi tap
    print('Tapped!');
  };

  Wrap __descCardSocmed() {
    SocMed socmed = currentUser.socialMedia;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        if (socmed.linkedin != null)
          Elevated_Btn_Component_About('LinkedIn', () {}, Icons.linked_camera,
              Color(0xFF0077B5), Colors.white),
        if (socmed.github != null)
          Elevated_Btn_Component_About(
              'Github', () {}, Icons.code, Color(0xFF24292F), Colors.white),
        if (socmed.instagram != null)
          Elevated_Btn_Component_About('Instagram', () {}, Icons.camera,
              Color(0xFFFB3958), Colors.white),
        if (socmed.facebook != null)
          Elevated_Btn_Component_About('Facebook', () {}, Icons.facebook,
              Color(0xFF3B5998), Colors.white),
        if (socmed.twitter != null)
          Elevated_Btn_Component_About('Twitter', () {},
              Icons.three_k_plus_outlined, Color(0xFF1DA1F2), Colors.white),
      ],
    );
  }

  /// SKILLS
  final String _titleCardSkills = 'Skills';
  final VoidCallback _$editCardSkills = () {
    // Kode untuk menangani aksi tap
    print('Tapped!');
  };

  Wrap __descCardSkills() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      runSpacing: 8.0,
      children: currentUser.skills
          .map(
            (skill) => Outlined_Btn_Component_About(skill, () {}, Colors.white),
          )
          .toList(),
    );
  }

  /// BLOCKS
  final VoidCallback _$editCardBlock = () {
    // Kode untuk menangani aksi tap
    print('Tapped!');
  };

  Markdown __descCardBlock(String desc) {
    return Markdown(
      shrinkWrap: true,
      selectable: true,
      data: desc,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  final VoidCallback $addOnPressed = () {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileElevatedButton(
                text: 'Add Block to Profile',
                $addOnPressed: $addOnPressed,
              ),
              const SizedBox(height: 16),
              Card_Component_AboutMe(
                _titleCardPersonal,
                _$editCardPersonal,
                __descCardPersonal(),
              ),
              Card_Component_AboutMe(
                _titleCardAbout,
                _$editCardAbout,
                __descCardAbout(),
              ),
              Card_Component_AboutMe(
                _titleCardSocmed,
                _$editCardSocmed,
                __descCardSocmed(),
              ),
              Card_Component_AboutMe(
                _titleCardSkills,
                _$editCardSkills,
                __descCardSkills(),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentUser.blockProfiles.length,
                itemBuilder: (context, index) {
                  final block = currentUser.blockProfiles[index];
                  return Card_Component_AboutMe(
                    block['title'],
                    _$editCardBlock,
                    __descCardBlock('server null ! cek postman'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
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
