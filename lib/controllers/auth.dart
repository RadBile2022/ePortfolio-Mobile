// import 'dart:convert';
//
// import 'package:eportfolio_mobile/controllers/api/services.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
//
// import 'api/endpoint.dart';
//
// class AuthController extends GetxController {
//   // List customerList = <Customer>[].obs;
//   var auth = Auth();
//   var service = AuthService();
//   var postLoading = true.obs;
//
//   @override
//   void onInit() {
//     readData();
//     super.onInit();
//   }
//
//   readData() async {
//     try {
//       postLoading.value = true;
//       Auth? result = await service.login();
//       if (result != null) {
//         print(result);
//       } else {
//         print('null');
//       }
//     } finally {
//       postLoading.value = false;
//     }
//     update();
//   }
//
//
// }
//
//
// class AuthService  {
//
//   Future<Auth?> login(Auth t) async {
//     final response = await post(Uri.parse(Endpoint.login),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(t.toJson()));
//
//     if (response.statusCode != 200) {
//       var data = json.decode(response.body);
//       if (data == 'Wrong Password'){
//         Auth.wrongpass = true;
//       } else if (data == 'User not Found'){
//         Auth.notfound = true;
//       }
//     } else {
//       var data = json.decode(response.body);
//       return Auth.fromJson(data);
//     }
//   }
// }
//
// class Auth  {
//   var email, password;
//    var jwt, userId;
//
//    Auth();
//   Auth.instance(this.jwt, this.userId);
//
//    Map<String, dynamic> toJson() {
//      return { 'email': email,
//        'password': password,
//      };
//    }
//   factory Auth.fromJson(Map<String, dynamic> json) {
//     return Auth.instance(
//       json['jwt'],
//       json['userId'],
//     );
//   }
// }