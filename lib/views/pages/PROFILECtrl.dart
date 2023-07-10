import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserController extends GetxController {
  var currentUser = User().obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  readData() async {
    try {
      postLoading.value = true;
      User? activeUser = await getUserService();
      if (activeUser != null) {
        currentUser(activeUser);
      } else {
        throw Exception('Failed to load User');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  Future<User?> getUserService() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

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
}
