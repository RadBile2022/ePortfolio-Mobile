import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/pages/HOMECtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> prefsInstance =
      SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      // final body = {"email": emailController.text, "password": passwordController.text};
      // final body = {"email": "rad@gmail.com", "password": "admin"};
      final body = {"email": "wahradar511@gmail.com", "password": "123simpan"};

      final response = await post(
        Uri.parse(Endpoint.$$login),
        headers: Endpoint.$httpHeader,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['message'] == 'success') {
          final SharedPreferences prefs = await prefsInstance;
          prefs.setString('jwt', json['jwt']);
          prefs.setString('userId', json['userId']);

          Get.offAllNamed(RouteNames.tabMain);
        } else {
          throw jsonDecode(response.body)["Message"] ??
              "FIELD__RESPONSE Error Occurred";
        }
      } else {
        // nanti liat cara ganti throw dengan respon yang ada diserver,
        throw Exception("Email atau Password Salah");
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString().replaceRange(0, 10, ''))],
          );
        },
      );
    }
  }
}

// class RegisterationController extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   Future<void> registerWithEmail() async {
//     try {
//       var headers = {'Content-Type ': 'application/json'};
//       var url = Uri.parse(
//           ApiEndpoints.basdUrl + ApiEndpoints.authEndpoints.registerEmail);
//
//       Map body = {
//         'name': nameController.text,
//         'email': emailController.text.trim(),
//         'password': passwordController.text
//       };
//
//       var response = await post(url, body: jsonEncode(body), headers: headers);
//
//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body);
//         if (json['code'] == 0) {
//           var token = json['data']['Token'];
//           print(token);
//           final SharedPreferences prefs = await _prefs;
//
//           await prefs?.setString('token', token);
//           nameController.clear();
//           emailController.clear();
//           passwordController.clear();
//         } else {
//           throw jsonDecode(response.body)["Message"] ?? "Unknown Error Ocurred";
//         }
//       } else {
//         throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
//       }
//     } catch (e) {
//       Get.back();
//       showDialog(
//           context: Get.context!,
//           builder: (context) {
//             return SimpleDialog(
//               title: Text('Error'),
//               contentPadding: EdgeInsets.all(20),
//               children: [Text(e.toString())],
//             );
//           });
//     }
//   }
// }
