import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPost.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();

  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      String postText = _postController.text;

      final newPost = Post();
      newPost.desc = postText;
      newPost.userId = '63dc6409165337cbbf8a1d8b';
      newPost.isPublic = false;
      newPost.comments = [];

      Get.find<PostController>().addPosts(newPost);
      Get.offAllNamed(RouteNames.tabMain);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Posts'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _postController,
                  decoration: InputDecoration(
                    labelText: 'Tulis Postingan Anda',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Isi postingan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitPost,
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
