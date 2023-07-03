import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();
  final postControl = Get.find<GetPostsController>();
  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      // Jika data post valid, lakukan tindakan yang sesuai (simpan ke database, dll.)
      String postText = _postController.text;
      // print('Postingan Anda: $postText');

      final newPost = PostModel();
      newPost.desc = postText;
      newPost.userId='63dc6409165337cbbf8a1d8b';
      newPost.isPublic=false;
      newPost.comments=[];
      postControl.addPosts(newPost);
      Get.offAllNamed(RouteNames.tabMain);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Posts'),),
      body:     Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _postController,
                decoration: InputDecoration(
                  labelText: 'Tulis Postingan Anda',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // Untuk memungkinkan postingan memiliki jumlah baris yang tidak terbatas
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

    );

  }
}
