import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{
  final userController = Get.find<GetUserController>();
  late GetUser? currentUser = userController.getUser.value;
  List getPostsList = <GetPosts>[].obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  readData() async {
    try {
      postLoading.value = true;
      List<GetPosts>? _getPostsList = await getPostsService();
      if (_getPostsList != null) {
        getPostsList.assignAll(_getPostsList);
      } else {
        throw Exception('Failed to load Posts Controller');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  Future<List<GetPosts>?> getPostsService() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getString('userId');
    // const userId = '6397fe5fbfe53e713a1c10d8';
    final response = await get(
      Uri.parse('${Endpoint.getPosts}/$userId'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      List postsResponse = jsonDecode(response.body);
      return postsResponse.map((e) => GetPosts.fromJson(e)).toList();
      // return GetPosts.fromJson(postsResponse);
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}