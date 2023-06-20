import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/components/profile_bar.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/get-user-page.dart';
import 'package:flutter/material.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

void main() async{


  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  var getUserCtrl = Get.put(GetUserController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfileScreen(),
    );
  }
}

class MyProfileScreen extends StatelessWidget {
  final List<Tab> myTabs = [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
  ];
  var getUserCtrl = Get.find<GetUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            preferredSize: Size.fromHeight(50), // Sesuaikan tinggi dengan tinggi FlexibleSpaceBar
            child: TabBar(labelColor: Colors.black,
              tabs: myTabs,
            )),

              flexibleSpace: FlexibleSpaceBar(
                background:  Obx(
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
                )
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: myTabs.map((Tab tab) {
                  return Center(
                    child:  AboutMeTab()
                    // Text(
                    //   'Cerpen atau cerita pendek merupakan salah satu jenis karya sastra yang sering dipelajari di bangku sekolah. Selain sebagai media hiburan, membaca cerpen pula dapat meningkatkan kemampuan membaca, menulis serta melatih kreativitas siswa. Cerpen sering kali digunakan sebagai bahan pelajaran dalam mata pelajaran Bahasa Indonesia, karena selain untuk mengasah kemampuan membaca dan menulis, cerpen juga mengandung nilai moral dan pesan yang dapat diambil oleh siswa. Selain itu, cerpen juga dapat mengajarkan siswa mengenai teknik penulisan, teknik pemaparan karakter, penokohan dan alur cerita.Cerpen atau cerita pendek merupakan salah satu jenis karya sastra yang sering dipelajari di bangku sekolah. Selain sebagai media hiburan, membaca cerpen pula dapat meningkatkan kemampuan membaca, menulis serta melatih kreativitas siswa. Cerpen sering kali digunakan sebagai bahan pelajaran dalam mata pelajaran Bahasa Indonesia, karena selain untuk mengasah kemampuan membaca dan menulis, cerpen juga mengandung nilai moral dan pesan yang dapat diambil oleh siswa. Selain itu, cerpen juga dapat mengajarkan siswa mengenai teknik penulisan, teknik pemaparan karakter, penokohan dan alur cerita.Cerpen atau cerita pendek merupakan salah satu jenis karya sastra yang sering dipelajari di bangku sekolah. Selain sebagai media hiburan, membaca cerpen pula dapat meningkatkan kemampuan membaca, menulis serta melatih kreativitas siswa. Cerpen sering kali digunakan sebagai bahan pelajaran dalam mata pelajaran Bahasa Indonesia, karena selain untuk mengasah kemampuan membaca dan menulis, cerpen juga mengandung nilai moral dan pesan yang dapat diambil oleh siswa. Selain itu, cerpen juga dapat mengajarkan siswa mengenai teknik penulisan, teknik pemaparan karakter, penokohan dan alur cerita.                                               ',
                    //
                    //   style: TextStyle(fontSize: 24),
                    // ),
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

class ProfileBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 270,
      child: Center(
        child: Text(
          'Profile Bar',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}


// import 'dart:convert';
//
// import 'package:androidflutter/views/home_page.dart';
// import 'package:androidflutter/widgets/dialogs.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class PageLogin extends StatefulWidget {
//   const PageLogin({Key? key}) : super(key: key);
//
//   @override
//   _PageLoginState createState() => _PageLoginState();
// }
//
// class HeadClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 4, size.height - 40, size.width / 2, size.height - 20);
//     path.quadraticBezierTo(
//         3 / 4 * size.width, size.height, size.width, size.height - 30);
//     path.lineTo(size.width, 0);
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
//
// class _PageLoginState extends State<PageLogin> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   var txtEditEmail = TextEditingController();
//   var txtEditPwd = TextEditingController();
//
//   Widget inputEmail() {
//     return TextFormField(
//         cursorColor: Colors.white,
//         keyboardType: TextInputType.emailAddress,
//         autofocus: false,
//         validator: (email) => email != null && !EmailValidator.validate(email)
//             ? 'Masukkan email yang valid'
//             : null,
//         controller: txtEditEmail,
//         onSaved: (String? val) {
//           txtEditEmail.text = val!;
//         },
//         decoration: InputDecoration(
//           hintText: 'Masukkan Email',
//           hintStyle: const TextStyle(color: Colors.white),
//           labelText: "Masukkan Email",
//           labelStyle: const TextStyle(color: Colors.white),
//           prefixIcon: const Icon(
//             Icons.email_outlined,
//             color: Colors.white,
//           ),
//           fillColor: Colors.white,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25.0),
//             borderSide: const BorderSide(
//               color: Colors.white,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25.0),
//             borderSide: const BorderSide(
//               color: Colors.white,
//               width: 2.0,
//             ),
//           ),
//         ),
//         style: const TextStyle(fontSize: 16.0, color: Colors.white));
//   }
//
//   Widget inputPassword() {
//     return TextFormField(
//       cursorColor: Colors.white,
//       keyboardType: TextInputType.text,
//       autofocus: false,
//       obscureText: true, //make decript inputan
//       validator: (String? arg) {
//         if (arg == null || arg.isEmpty) {
//           return 'Password harus diisi';
//         } else {
//           return null;
//         }
//       },
//       controller: txtEditPwd,
//       onSaved: (String? val) {
//         txtEditPwd.text = val!;
//       },
//       decoration: InputDecoration(
//         hintText: 'Masukkan Password',
//         hintStyle: const TextStyle(color: Colors.white),
//         labelText: "Masukkan Password",
//         labelStyle: const TextStyle(color: Colors.white),
//         prefixIcon: const Icon(
//           Icons.lock_outline,
//           color: Colors.white,
//         ),
//         fillColor: Colors.white,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           borderSide: const BorderSide(
//             color: Colors.white,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25.0),
//           borderSide: const BorderSide(
//             color: Colors.white,
//             width: 2.0,
//           ),
//         ),
//       ),
//       style: const TextStyle(fontSize: 16.0, color: Colors.white),
//     );
//   }
//
//   void _validateInputs() {
//     if (_formKey.currentState!.validate()) {
//       //If all data are correct then save data to out variables
//       _formKey.currentState!.save();
//       doLogin(txtEditEmail.text, txtEditPwd.text);
//     }
//   }
//
//   doLogin(email, password) async {
//     final GlobalKey<State> _keyLoader = GlobalKey<State>();
//     Dialogs.loading(context, _keyLoader, "Proses ...");
//
//     try {
//       final response = await http.post(
//           Uri.parse("https://api.sobatcoding.com/testing/login"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode({
//             "email": email,
//             "password": password,
//           }));
//
//       final output = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                 output['message'],
//                 style: const TextStyle(fontSize: 16),
//               )),
//         );
//
//         if (output['success'] == true) {
//           saveSession(email);
//         }
//         //debugPrint(output['message']);
//       } else {
//         Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
//         //debugPrint(output['message']);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                 output.toString(),
//                 style: const TextStyle(fontSize: 16),
//               )),
//         );
//       }
//     } catch (e) {
//       Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
//       Dialogs.popUp(context, '$e');
//       debugPrint('$e');
//     }
//   }
//
//   saveSession(String email) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString("email", email);
//     await pref.setBool("is_login", true);
//
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => const HomePage(),
//       ),
//           (route) => false,
//     );
//   }
//
//   void ceckLogin() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var islogin = pref.getBool("is_login");
//     if (islogin != null && islogin) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (BuildContext context) => const HomePage(),
//         ),
//             (route) => false,
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     ceckLogin();
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Container(
//         margin: const EdgeInsets.all(0),
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.blueAccent, Color.fromARGB(255, 21, 236, 229)],
//             )),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               ClipPath(
//                 clipper: HeadClipper(),
//                 child: Container(
//                   margin: const EdgeInsets.all(0),
//                   width: double.infinity,
//                   height: 180,
//                   decoration: const BoxDecoration(
//                     color: Colors.amber,
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/logo-white-sm.png'),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(8.0),
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "LOGIN APP",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                   padding:
//                   const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//                   child: Column(
//                     children: <Widget>[
//                       inputEmail(),
//                       const SizedBox(height: 20.0),
//                       inputPassword(),
//                       const SizedBox(height: 5.0),
//                     ],
//                   )),
//               Container(
//                 padding:
//                 const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//                 child: ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.amber,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                           side: const BorderSide(color: Colors.blue),
//                         ),
//                         elevation: 10,
//                         minimumSize: const Size(200, 58)),
//                     onPressed: () => _validateInputs(),
//                     icon: const Icon(Icons.arrow_right_alt),
//                     label: const Text(
//                       "LOG IN",
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



class SocialMediaScreen extends StatelessWidget {
  // Variabel Global
  final String? linkedin;
  final String? github;
  final String? ig;
  final String? facebook;
  final String? twitter;

  SocialMediaScreen({
    this.linkedin,
    this.github,
    this.ig,
    this.facebook,
    this.twitter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Social Media',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-socmed');
                  },
                  child: Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),




            Container(
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Wrap(
                children: [
                  if (linkedin != null)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0077B5),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.linked_camera,
                        size: 20.0,
                      ),
                      label: Text(
                        'LinkedIn',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (github != null)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF24292F),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.code,
                        size: 20.0,
                      ),
                      label: Text(
                        'Github',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (ig != null)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFB3958),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.camera,
                        size: 20.0,
                      ),
                      label: Text(
                        'Instagram',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (facebook != null)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF3B5998),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.facebook,
                        size: 20.0,
                      ),
                      label: Text(
                        'Facebook',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (twitter != null)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1DA1F2),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(
                        Icons.three_k_plus_outlined,
                        size: 20.0,
                      ),
                      label: Text(
                        'Twitter',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SkillsPage extends StatelessWidget {
  final List<String> skills = [
    'Flutter',
    'Dart',
    'UI Design',
    'Firebase',
    'API Integration',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // Handle edit button tap
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ],
            ),


              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children:
                skills
                    .map(
                      (skill) =>
                      Outline_Btn_Component_About(skill, () { }, Colors.white),

                )
                    .toList(),
              ),

          ],
        ),
      ),
    );
  }
}






// void main() {
//   runApp(MyApp());
// }

class Block {
  final String title;
  final String desc;
  final bool about;

  Block({required this.title, required this.desc, this.about = false});
}

class MyApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Blocks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(blocks: blocks),
        '/edit-block': (context) => EditBlockScreen(),
      },
    );
  }
}
class HomeScreen extends StatelessWidget {
  final List<Block> blocks;

  HomeScreen({required this.blocks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Blocks'),
      ),
      body: ListView.builder(
        itemCount: blocks.length,
        itemBuilder: (context, index) {
          final block = blocks[index];
          return


            Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      block.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigasi ke halaman edit-block
                        Navigator.pushNamed(context, '/edit-block/$index');
                      },
                      child: Icon(Icons.edit),
                    ),
                  ],
                ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(top: 8),
                    child: MarkdownBody(
                      data: block.desc,
                      // styleSheet: MarkdownStyleSheet(
                      //   backgroundColor: Colors.white,
                      // ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EditBlockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Block'),
      ),
      body: Center(
        child: Text('Edit Block Screen'),
      ),
    );
  }
}