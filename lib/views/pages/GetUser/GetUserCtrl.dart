import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUser {
  var id, username, profilePicture, followings = [], followers = [];

  var role,
      academicField,
      interest,
      nim,
      major,
      organization,
      city,
      dateBirth,
      gender;

  var about, socialMedia, skills = [], blockProfiles = [];
  var createdAt, email;

  GetUser.instance({
    this.id,
    this.username,
    this.profilePicture,
    required this.followings,
    required this.followers,
    this.role,
    this.academicField,
    this.interest,
    this.nim,
    this.major,
    this.organization,
    this.city,
    this.dateBirth,
    this.gender,
    this.about,
    this.socialMedia,
    required this.skills,
    required this.blockProfiles,
    this.createdAt,
    this.email,
  });

  GetUser();

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser.instance(
      id: json['_id'],
      username: json['username'],
      profilePicture: '${Endpoint.$$baseUrl}/${json['profilePicture']}',
      followings: json['following'],
      followers: json['followers'],
      role: json['role'],
      academicField: json['academicField'],
      interest: json['interest'],
      nim: json['nim'],
      major: json['major'],
      organization: json['organization'],
      city: json['city'],
      dateBirth: json['dateBirth'],
      gender: json['gender'],
      about: json['about'],
      socialMedia: SocMed.fromJson(json['socialMedia']),
      skills: json['skill'],
      blockProfiles: json['blockProfile'],
      createdAt: json['createdAt'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'GetUser{id: $id, username: $username, profilePicture: $profilePicture, followings: $followings, followers: $followers, role: $role, academicField: $academicField, interest: $interest, nim: $nim, major: $major, organization: $organization, city: $city, dateBirth: $dateBirth, gender: $gender, about: $about, socialMedia: $socialMedia, skills: $skills, blockProfiles: $blockProfiles, createdAt: $createdAt, email: $email}';
  }
}

class SocMed {
  var linkedin, github, instagram, facebook, twitter;

  SocMed.instance(
    this.linkedin,
    this.github,
    this.instagram,
    this.facebook,
    this.twitter,
  );

  factory SocMed.fromJson(Map<String, dynamic> json) {
    return SocMed.instance(
      json['linkedin'],
      json['github'],
      json['instagram'],
      json['facebook'],
      json['twitter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'linkedin': linkedin,
      'github': github,
      'instagram': instagram,
      'facebook': facebook,
      'twitter': twitter,
    };
  }
}

class CurrentUserController extends GetxController {
  var currentUser = GetUser().obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  readData() async {
    try {
      postLoading.value = true;
      GetUser? activeUser = await getUserService();
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

  Future<GetUser?> getUserService() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getString('userId');
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
}

// class GetUserController extends GetxController {
//
//   List getCurrentUsers = <GetUser>[].obs;
//   var postLoading = true.obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     readData();
//   }
//
//   readData() async {
//     try {
//       postLoading.value = true;
//       for (GetUser user in getCurrentUsers) {
//
//       }
//
//       GetUser? _getUser = await getUserService();
//       if (_getUser != null) {
//         getUser(_getUser);
//       } else {
//         throw Exception('Failed to load User');
//       }
//     } finally {
//       postLoading.value = false;
//     }
//     update();
//   }
//
//   Future<GetUser?> getUserService(String userId) async {
//     final response = await get(
//       Uri.parse('${Endpoint.getUser}/$userId'),
//       headers: Endpoint.$httpHeader,
//     );
//
//     if (response.statusCode == 200) {
//       var aboutMe = jsonDecode(response.body);
//       return GetUser.fromJson(aboutMe);
//     } else {
//       throw Exception('Failed to load User');
//     }
//   }
// }

// topTabCtrl = AnimationController(
//   vsync: this,
//   duration: const Duration(
//     milliseconds: 2500,
//   ),
// );
