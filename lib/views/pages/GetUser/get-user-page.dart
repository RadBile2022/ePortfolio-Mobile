import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/components/profile_bar.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class ProfilePage extends StatelessWidget {
  var getUserCtrl = Get.put(GetUserController());


  final List<Tab> myTabs = [
    Tab(text: 'About Me'),
    Tab(text: 'Posts'),
    Tab(text: 'Articles'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: DefaultTabController(
        length: myTabs.length,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              floating: true,
              pinned: true,
              expandedHeight: 300,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  // Sesuaikan tinggi dengan tinggi FlexibleSpaceBar
                  child: TabBar(
                    labelColor: Colors.black,
                    tabs: myTabs,
                  )),
              flexibleSpace: FlexibleSpaceBar(
                background: GetBuilder<GetUserController>(
                  builder: (controller) {
                    final GetUser currentUser = controller.getUser.value;

                    return Column(
                      children: [
                        Profile_Bar(
                          profilePicture: currentUser.profilePicture,
                          name: currentUser.username,
                          role: currentUser.role,
                          major: currentUser.major,
                          nim: currentUser.nim,
                          interest: currentUser.interest,
                          academicField: currentUser.academicField,
                          following: currentUser.followings,
                          followers: currentUser.followers,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: myTabs.map((Tab tab) {
                  return Center(
                    child: GetBuilder<GetUserController>(
                      builder: (controller) {
                        return AboutMeTab(
                          currentUser: controller.getUser.value,
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
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
            (skill) => Outline_Btn_Component_About(skill, () {}, Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add block to profile"),
                    Icon(Icons.add),
                  ],
                ),
              ),
              SizedBox(height: 16),
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

/*
class ProfilePage extends StatefulWidget {
  var getUserCtrl = Get.put(GetUserController());

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var getUserCtrl = Get.find<GetUserController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hallo Dek')),
        body:CustomScrollView(
          slivers:<Widget> [
            SliverAppBar(
              title: Text('App Bar Title'),
              pinned: true,
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                ],
              ),
              // Konfigurasi SliverAppBar lainnya
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              snap: true,

              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  background: Obx(
                        () => Column(
                      children: [
                        Profile_Bar(
                            profilePicture:
                            '${Endpoint.baseUrl}/${getUserCtrl.getUser.value.profilePicture}',
                            name: getUserCtrl.getUser.value.username,
                            role: getUserCtrl.getUser.value.role,
                            major: getUserCtrl.getUser.value.major,
                            nim: getUserCtrl.getUser.value.nim,
                            interest: getUserCtrl.getUser.value.interest,
                            academicField: getUserCtrl.getUser.value.academicField,
                            following: getUserCtrl.getUser.value.followings,
                            followers: getUserCtrl.getUser.value.followers),
                      ],
                    ),
                  )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return AboutMeTab();
                },
              ),
            ),
          ],
        )



      // NestedScrollView(
      //   controller: getUserCtrl.scrollCtrl,
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return [
      //       SliverAppBar(
      //         backgroundColor: Colors.white,
      //         floating: true,
      //         snap: true,
      //         expandedHeight: 300,
      //         flexibleSpace: FlexibleSpaceBar(
      //             background: Obx(
      //           () => Column(
      //             children: [
      //               Profile_Bar(
      //                   profilePicture:
      //                       '${Endpoint.baseUrl}/${getUserCtrl.getUser.value.profilePicture}',
      //                   name: getUserCtrl.getUser.value.username,
      //                   role: getUserCtrl.getUser.value.role,
      //                   major: getUserCtrl.getUser.value.major,
      //                   nim: getUserCtrl.getUser.value.nim,
      //                   interest: getUserCtrl.getUser.value.interest,
      //                   academicField: getUserCtrl.getUser.value.academicField,
      //                   following: getUserCtrl.getUser.value.followings,
      //                   followers: getUserCtrl.getUser.value.followers),
      //             ],
      //           ),
      //         )),
      //       ),
      //       SliverPersistentHeader(
      //         delegate: _SliverAppBarDelegate(
      //           TabBar(
      //             controller: _tabController,
      //             labelColor: Colors.black87,
      //             unselectedLabelColor: Colors.grey,
      //             tabs: [
      //               Tab(text: 'Tab 1'),
      //               Tab(text: 'Tab 2'),
      //               Tab(text: 'Tab 3'),
      //             ],
      //           ),
      //         ),
      //         pinned: true,
      //       ),
      //     ];
      //   },
      //   body: TabBarView(
      //     controller: _tabController,
      //     children: [
      //       AboutMeTab(),
      //       Container(
      //         child: Center(
      //           child: Text('Tab 2 content'),
      //         ),
      //       ),
      //       Container(
      //         child: Center(
      //           child: Text('Tab 3 content'),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
*/
