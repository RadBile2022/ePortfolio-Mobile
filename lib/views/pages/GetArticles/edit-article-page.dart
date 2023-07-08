import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetxArticle.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetxArticleController.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetxPost.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetxPostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditArticlePage extends StatelessWidget {
  final articleController = Get.find<ArticleController>();
  final idArticle = Get.arguments;
  late Article? article = articleController.findArticleById(idArticle);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();


  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      String postText = _postController.text;

      article!.desc = postText;
      article!.userId = '63dc6409165337cbbf8a1d8b';
      article!.isPublic = false;
      article!.comments = [];

      // Get.find<GetPostsController>().addPosts(newPost);
      articleController.updateArticle(article!);
      Get.offAllNamed(RouteNames.tabMain);
    }
  }

  @override
  Widget build(BuildContext context) {
    _postController.text = article!.desc;
    print(article!.desc);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Article'),
      ),
      body: Form(
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
                child: Text('Article'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
