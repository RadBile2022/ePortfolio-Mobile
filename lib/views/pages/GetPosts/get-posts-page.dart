import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class GetPostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GetBuilder<GetPostsController>(
        builder: (controller) {
          final List  currentUser = controller.getPostsList;

          return
            SingleChildScrollView(child: Text(currentUser.toString()),);
        },
      ),
    );
  }
  
}