import 'package:eportfolio_mobile/views/components/profile_bar.dart';
import 'package:eportfolio_mobile/views/components/profile_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

//
//
//   fetch data{
//     return data
// }
//
//   Data dataDosen = Data.instance(fetc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hallo dek')),
      body: Column(
        children: [
          // Profile_Bar(masukno data),
          Scrollbar(child:  Profile_Tabs(),)
         ],
      ),
    );
  }
}

