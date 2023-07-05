import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/HOMECtrl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Post {
  var id, userId, title, desc, isPublic, createdAt, updatedAt;
  var comments = [];

  // comments nanti dulu
  Post.instance({
    this.id,
    this.userId,
    this.desc,
    this.isPublic,
    this.createdAt,
    this.updatedAt,
    required this.comments,
  });

  Post();

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post.instance(
      id: json['_id'],
      userId: json['userId'],
      desc: json['desc'],
      isPublic: json['isPublic'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'desc': desc,
      'isPublic': isPublic,
      // 'comments': comments.map((e) => e.toJson().toList()),
    };
  }

  @override
  String toString() {
    return 'GetPosts{id: $id, userId: $userId, desc: $desc, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt, comments: $comments}';
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

class GetPostsController extends GetxController {
  final homeController = Get.find<HomeController>();
  final userController = Get.find<CurrentUserController>();
  late GetUser? currentUser = userController.currentUser.value;
  List postList = <Post>[].obs;
  var postLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  void readData() async {
    try {
      postLoading.value = true;
      List<Post>? getPosts = await getPostsService();
      if (getPosts != null) {
        postList.assignAll(getPosts);
      } else {
        throw Exception('Failed to load Posts Controller');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  Future<List<Post>?> getPostsService() async {
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
      return postsResponse.map((e) => Post.fromJson(e)).toList();
      // return GetPosts.fromJson(postsResponse);
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  void addPosts(Post t) async {
    await createService(t);
    postList.add(t);
    readData();
    // homeController.readContents();
  }

  Future<void> createService(Post t) async {
    final response = await post(
      Uri.parse(Endpoint.createPost),
      headers: Endpoint.$httpHeader,
      body: jsonEncode(t.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed Create Post');
    }
  }

  Post? findPostById(String? id) {
    for (Post p in postList) {
      if (p.id == id) {
        return p;
      }
    }
    return null;
  }

  void updatePost(Post t) async {
    update();
    await updateService(t);
    // homeController.readContents();
  }

  Future<void> updateService(Post t) async {
    final response = await put(
      Uri.parse('${Endpoint.updatePost}/${t.id}'),
      headers: Endpoint.$httpHeader,
      body: jsonEncode(t.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed Delete Post . Error: ${response.statusCode}');
    }

    // if (response.statusCode == 200) {
    //   print('Customer updated successfully!');
    // } else {
    //   print('Failed to update customer. Error: ${response.statusCode}');
    // }
  }

  void deletePost(String id) async {
    Post? post = findPostById(id);
    await removeService(post!);
    postList.remove(post);
    update();
  }

  Future<void> removeService(Post t) async {
    final response = await delete(
      Uri.parse('${Endpoint.updatePost}/${t.id}'),
      headers: Endpoint.$httpHeader,
      body: json.encode(t),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed Delete Post . Error: ${response.statusCode}');
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
