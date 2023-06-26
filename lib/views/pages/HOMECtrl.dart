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

  final userController = Get.find<GetUserController>();
  late GetUser? currentUser = userController.getUser.value;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  readData() async {
    try {
      postLoading.value = true;
      List<GetPosts>? _getPostsList = await getPostsTimeLineService();
      List<GetArticles>? _getArticlesList = await getArticlesTimeLineService();
      if (_getArticlesList != null && _getPostsList != null) {
        if (_getPostsList != null) {
          all.assignAll(_getPostsList);
          _getPostsList.map((e) {
            // filter private post
            if (e.isPublic == false && e.userId != currentUser?.id) {
              // Do nothing for private post
            } else {
              print('hallo dek');
              print(e);
              all.add(e);

            }
          });
        }

        // if (_getArticlesList != null) {
        //   all.assignAll(_getArticlesList);
        //   _getArticlesList.map((e) {
        //     // filter private article
        //     if (e.isPublic == false && e.userId != currentUser?.id) {
        //       // Do nothing for private article
        //     } else {
        //       all.add(e);
        //       all =all;
        //
        //     }
        //   });
        //
        //   // sorting all posts and articles
        //   all.sort((a, b) {
        //     return DateTime.parse(b['createdAt'])
        //         .compareTo(DateTime.parse(a['createdAt']));
        //   });
        // }
      } else {
        throw Exception(
            'Failed to load Posts && Articles Time Line Controller');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  Future<List<GetPosts>?> getPostsTimeLineService() async {
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
      return postsResponse.map((e) => GetPosts.fromJson(e)).toList();
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
