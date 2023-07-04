import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetArticlesCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List<dynamic> all = [].obs;
  List contentUsers = <GetUser>[].obs;

  final userController = Get.find<CurrentUserController>();
  late GetUser? currentUser = userController.currentUser.value;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readContents();
    readUsers();
  }
    readUsers() async {
    for (var item in all) {
      var userId = item.userId;
     contentUsers.add(await getUserService(userId)) ;
      print(userId);
    }
    print(contentUsers);

  }
  Future<GetUser?> getUserService(String userId) async {
    final response = await get(
      Uri.parse('${Endpoint.getUser}/$userId'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      var aboutMe = jsonDecode(response.body);
      return GetUser.fromJson(aboutMe);
    } else {
      throw Exception('Failed to load User');
    }
  }


   readContents() async {
    try {
      postLoading.value = true;
      List<Post>? _getPostsList = await getPostsTimeLineService();
      List<GetArticles>? _getArticlesList = await getArticlesTimeLineService();
      if (_getArticlesList != null && _getPostsList != null) {
        all.clear();
        all.addAll(_getPostsList);
        all.addAll(_getArticlesList);
        all.sort((a, b) => b.createdAt.compareTo(a.createdAt));

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
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getString('userId');
    // const userId = '6397fe5fbfe53e713a1c10d8';
    final response = await get(
      Uri.parse('${Endpoint.getPostsTimeLine}/$userId'),
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

  Future<List<GetArticles>?> getArticlesTimeLineService() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getString('userId');
    // const userId = '6397fe5fbfe53e713a1c10d8';
    final response = await get(
      Uri.parse('${Endpoint.getArticlesTimeLine}/$userId'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      List postsResponse = jsonDecode(response.body);
      return postsResponse.map((e) => GetArticles.fromJson(e)).toList();
      // return GetPosts.fromJson(postsResponse);
    } else {
      throw Exception('Failed to load Articles Time Line');
    }
  }


}
