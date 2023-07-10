import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutMeTabPage extends StatelessWidget {
  final User user;

  AboutMeTabPage({super.key, required this.user});

  /// PERSONAL INFORMATION
  final String _titleCardPersonal = 'Personal Information';
  final VoidCallback _$editCardPersonal = () {
    print('Tapped!');
  };

  Column __descCardPersonal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name: ${user.username}"),
        if (user.role == "mahasiswa")
          Text("Student ID: ${user.nim ?? ""}"),
        if (user.role == "mahasiswa")
          Text("Major: ${user.major ?? ""}"),
        if (user.role != "mahasiswa")
          Text("Academic Field: ${user.academicField ?? ""}"),
        Text("Organization: ${user.organization ?? ""}"),
        Text("City: ${user.city ?? ""}"),
        Text("Date Of Birth: ${user.dateBirth ?? ""}"),
        Text("Gender: ${user.gender ?? ""}"),
        Text("Role: ${user.role ?? ""}"),
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
      data: user.about,
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
    SocMed socmed = user.socialMedia;

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
      children: user.skills
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
                itemCount: user.blockProfiles.length,
                itemBuilder: (context, index) {
                  final block = user.blockProfiles[index];
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
