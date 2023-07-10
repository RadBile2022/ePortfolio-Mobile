import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticle.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticleController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddArticlePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();


  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      String postText = _postController.text;

      final newArticle = Article();
      newArticle.desc = postText;
      newArticle.title = 'Title Dummy';
      newArticle.userId = '63dc6409165337cbbf8a1d8b';
      newArticle.isPublic = false;
      newArticle.comments = [];

      Get.find<ArticleController>().addArticles(newArticle);
      Get.offAllNamed(RouteNames.tabMain);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Article'),
      ),
      body:

      Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _postController,
                decoration: InputDecoration(
                  labelText: 'Tulis Article Anda',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi article tidak boleh kosong';
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
