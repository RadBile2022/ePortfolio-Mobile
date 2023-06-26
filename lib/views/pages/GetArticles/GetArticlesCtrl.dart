import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetArticles {
  var id, userId, title, desc, coverArticle, isPublic;
  var tags = [];
  var createdAt, updatedAt;

  var comments = [];

  // comments nanti dulu
  GetArticles.instance({
    this.id,
    this.userId,
    this.title,
    this.desc,
    this.coverArticle,
    this.isPublic,
    required this.tags,
    this.createdAt,
    this.updatedAt,
    required this.comments,
  });

  GetArticles();

  factory GetArticles.fromJson(Map<String, dynamic> json) {
    return GetArticles.instance(
      id: json['_id'],
      userId: json['userId'],
      title: json['title'],
      desc: json['desc'],
      coverArticle: json['coverArticle'],
      isPublic: json['isPublic'],
      tags: json['tags'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'title' : title,
      'desc': desc,
      'coverArticle' : coverArticle,
      'isPublic': isPublic,
      'tags': tags,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'comments': comments.map((e) => e.toJson().toList()),
    };
  }

  @override
  String toString() {
    return 'GetArticles{id: $id, userId: $userId, title: $title, desc: $desc, coverArticle: $coverArticle, isPublic: $isPublic, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, comments: $comments}';
  }
}

class Comment {
  var id, userId, comment, date;

  Comment.instance({
    this.id,
    this.userId,
    this.comment,
    this.date,
  });

  Comment();

  @override
  String toString() {
    return 'Comment{id: $id, userId: $userId, comment: $comment, date: $date}';
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment.instance(
      id: json['_id'],
      userId: json['userId'],
      comment: json['comment'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'comment': comment,
      'date': date,
    };
  }

}

class GetArticlesController extends GetxController {
  final userController = Get.find<GetUserController>();
  late GetUser? currentUser = userController.getUser.value;
  List getArticlesList = <GetArticles>[].obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  readData() async {
    try {
      postLoading.value = true;
      List<GetArticles>? _getArticlesList = await getArticlesService();
      if (_getArticlesList != null) {
        getArticlesList.assignAll(_getArticlesList);
      } else {
        throw Exception('Failed to load Articles Controller');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  Future<List<GetArticles>?> getArticlesService() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getString('userId');
    // const userId = '6397fe5fbfe53e713a1c10d8';
    final response = await get(
      Uri.parse('${Endpoint.getArticles}/$userId'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      List postsResponse = jsonDecode(response.body);
      return postsResponse.map((e) => GetArticles.fromJson(e)).toList();
      // return GetPosts.fromJson(postsResponse);
    } else {
      throw Exception('Failed to load Articles');
    }
  }
}
//
// "_id": "63fed9cbf6f6281b499d23fc",
// "userId": "6397fe5fbfe53e713a1c10d8",
// "desc": "## AI Center UB\nUniversitas Brawijaya (UB) melaunching Artificial Intelligence (AI) Center, Rabu (15/02/2023). Rektor UB Prof. Widodo, S.Si., M.Si., Ph.D.Med.Sc saat meresmikan menyampaikan, AI Center diharapkan dapat menjadi media kolaborasi antar bidang keilmuan, serta mengakselerasi kegiatan penelitian yang ada di UB.\n(https://prasetya.ub.ac.id/ub-launching-ai-center/)\n\nSebagai kampus digital dengan fasilitas AI Center maka UB telah membuktikan sebagai kampus yang mampu mengikuti perkembangan teknologi, selaras dengan maraknya produk-produk AI tool. Dengan adanya fasilitas ini diharapkan hasil-hasil penelitian akan lebih berkualitas sebagai percepatan dari proses hilirisasi dan kemanfaatan produk penelitian kepada masyarakat.  Kolaborasi antar fakultas menjadi moment yang ditunggu-tunggu dan menjadikan suasana penelitian yang terintegrasi.  Dengan AI supercomputer percepatan komputasi jauh lebih cepat seperti disampaikan Prof. Wayan Firdaus sebagai ketua AI Center UB.\n\nSelengkapnya bisa dilihat di \n\nhttps://www.youtube.com/watch?v=Y8wlrk6sdTE",
// "isPublic": true,
// "createdAt": "2023-03-01T04:51:23.242Z",
// "comments": [],
// "updatedAt": "2023-03-03T05:58:36.023Z",
// "__v": 0
