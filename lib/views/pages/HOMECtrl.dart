import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticle.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPost.dart';
import 'package:eportfolio_mobile/views/pages/PROFILECtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final userCtrl = Get.find<CurrentUserController>();
  late User? currentUser = userCtrl.currentUser.value;
  List contentList = <dynamic>[].obs;
  List contentsUsers = <User>[].obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readContents();
    readUsers();
  }

  Future<void> readUsers() async {
    for (var content in contentList) {
      var userId = content.userId;
      contentsUsers.add(await getUserService(userId));
    }
  }

  Future<User?> getUserService(String userId) async {
    final response = await get(
      Uri.parse('${Endpoint.getUser}/$userId'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      var aboutMe = jsonDecode(response.body);
      return User.fromJson(aboutMe);
    } else {
      throw Exception('Failed to load User');
    }
  }

  readContents() async {
    try {
      postLoading.value = true;
      List<Post>? postListTimeLine = await getPostsTimeLineService();
      List<Article>? articleListTimeLine = await getArticlesTimeLineService();
      if (articleListTimeLine != null && postListTimeLine != null) {
        contentList.clear();
        contentList.addAll(postListTimeLine);
        contentList.addAll(articleListTimeLine);
        contentList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      } else {
        throw Exception(
            'Failed to load Posts && Articles Time Line Controller');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  Future<List<Post>?> getPostsTimeLineService() async {
    final response = await get(
      Uri.parse('${Endpoint.getPostsTimeLine}/63dc6409165337cbbf8a1d8b'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      List postsResponse = jsonDecode(response.body);
      return postsResponse.map((e) => Post.fromJson(e)).toList();
      // return GetPosts.fromJson(postsResponse);
    } else {
      throw Exception('Failed to load Posts Time Line');
    }
  }

  Future<List<Article>?> getArticlesTimeLineService() async {
    final response = await get(
      Uri.parse('${Endpoint.getArticlesTimeLine}/63dc6409165337cbbf8a1d8b'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      List postsResponse = jsonDecode(response.body);
      return postsResponse.map((e) => Article.fromJson(e)).toList();
      // return GetPosts.fromJson(postsResponse);
    } else {
      throw Exception('Failed to load Articles Time Line');
    }
  }
}
