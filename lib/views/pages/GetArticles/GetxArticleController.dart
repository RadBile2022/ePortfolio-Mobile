import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetxArticle.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ArticleController extends GetxController {
  final userController = Get.find<CurrentUserController>();
  final currentUserControl = Get.find<CurrentUserController>();

  late GetUser? currentUser = userController.currentUser.value;
  List articleList = <Article>[].obs;
  var articleLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  readData() async {
    try {
      articleLoading.value = true;
      List<Article>? getArticles = await getArticlesService();
      if (getArticles != null) {
        articleList.assignAll(getArticles);
      } else {
        throw Exception('Failed to load Articles Controller');
      }
    } finally {
      articleLoading.value = false;
    }
    update();
  }
  Future<List<Article>?> getArticlesService() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final userId = prefs.getString('userId');
    // const userId = '6397fe5fbfe53e713a1c10d8';
    final response = await get(
      Uri.parse('${Endpoint.getArticles}/$userId'),
      headers: Endpoint.$httpHeader,
    );

    if (response.statusCode == 200) {
      List articlesResponse = jsonDecode(response.body);
      return articlesResponse.map((e) => Article.fromJson(e)).toList();
      // return Getarticles.fromJson(articlesResponse);
    } else {
      throw Exception('Failed to load Articles');
    }
  }



  void addArticles(Article t) async {
    await createService(t);
    articleList.add(t);
    readData();
    // homeController.readContents();
  }

  Future<void> createService(Article t) async {
    final response = await post(
      Uri.parse(Endpoint.createArticle),
      headers: Endpoint.$httpHeader,
      body: jsonEncode(t.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed Create article');
    }
  }

  Article? findArticleById(String? id) {
    for (Article t in articleList) {
      if (t.id == id) {
        return t;
      }
    }
    return null;
  }

  void updateArticle(Article t) async {
    update();
    await updateService(t);
    // homeController.readContents();
  }

  Future<void> updateService(Article t) async {
    final response = await put(
      Uri.parse('${Endpoint.updateArticle}/${t.id}'),
      headers: Endpoint.$httpHeader,
      body: jsonEncode(t.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed Delete article . Error: ${response.statusCode}');
    }
  }

  void deleteArticle(String id) async {
    Article? article = findArticleById(id);
    await removeService(article!);
    articleList.remove(article);
    update();
  }

  Future<void> removeService(Article t) async {
    final response = await delete(
      Uri.parse('${Endpoint.deleteArticle}/${t.id}'),
      headers: Endpoint.$httpHeader,
      body: json.encode(t),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed Delete article . Error: ${response.statusCode}');
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


// {
// "_id": "63e038aa165337cbbf8a455e",
// "userId": "6397fe5fbfe53e713a1c10d8",
// "title": "Teknik Hilirisasi Produk",
// "desc": "Hilirisasi merupakan istilah yang digunakan untuk mewujudkan suatu ide penelitian menjadi produk yang siap pakai, mass produk.  Berapa banyak step yang diperlukan untuk menjadi produk jadi tergantung pada kompleksitas dari ide tersebut.  Dalam kerangka sistem yang besar, suatu desain bisa memerlukan bertahun-tahun untuk menjadi produk yang siap untuk ditawarkan.  Apakah sampai semua sistem jadi atau berdasarkan modul?  Hindari terlalu banyak ide sehingga tidak satupun modul menjadi siap produk.  Antara ide - prototipe - dan produk.\n\nHilirisasi sebagai upaya untuk mendekatkan hasil penelitian dan inovasi kepada user atau industri, mempunyai beberapa tahap proses yang tidak mudah. sederhanya sebagai berikut ini:\n- fase ide / problem solving sampai menemukan metode yang terbaik.\n- fase prototipe awal digunakan untuk menguji metode\n- fase prototipe sampai produk memerlukan banyak proses - REFACTORING\n- fase prototipe final lebih didekatkan dengan kelayakan dari market\n- fase test bed produk dengan lingkungan sebenarnya.\n\nUntuk bidang produk software setiap fase dapat didekati dengan istilah REFACTORING.  Proses perbaikan dan penyesuaian dengan lingkungan industri atau market, kelayakan aplikasi yang sesuai dengan kebutuhan industri.  Software akan semakin baik dan teruji pada lingkungan yang sebenarnya.\n\nStrategi refactoring sangat menentukan kecepatan dan kematangan suatu prototipe.  Strategi yang tepat akan mempercepat waktu dari ide sampai menjadi produk.  Refactoring yang efektif dapat dikondisikan sejak awal.  Vendor-vendor software besar mempunyai strategi yang baik sesuai dengan perencanaan dari sisi manajemen, mulai dari ide sehinigga software siap Launching.\n\nStrategi perencanaan ini meliputi :\n1. Fase Ide - problem domain.  Problem yang diangkat harus mempunyai VALUE ADDED dan sebaiknya merupakan kebutuhan terkini dari industri.  Bahkan memungkin untuk terlebih dahulu dilakukan studi kelayakan dari permasalahan tersebut.  Ide adalah solusi praktis yang dapat segera diimplementasikan pada problem tersebut.\n2. Fase researching.  Setelah teridentifikasi permasalahan, maka direncanakan hipotesa solusi dan dilakukan research untuk mendapatkan metode terbaik penyelesaian problem tersebut.\n3. Fase prototype awal.  Protoyping Awal adalah fungsi software sebagai implementasi fungsional dari metode yang diterapkan sebagai hasil inovasi penelitian.\n4. Fase refactoring ...\n5. Fase refactoring ...\n6. Fase prototyping Final\n6. Production\n\n### Refactoring\nRefactoring merupakan proses memperbaiki internal software dan menyesuaikan dengan kebutuhan dari user atau industri.  Proses ini dilakukan beberapa kali, minimal 3 x refactoring yaitu:\n- Refactoring pada prototype awal\n- Refactoring pada prototype final\n- Refactoring pada pra produksi\nTetapi perjalanan yang cukup memakan waktu adalah proses refactoring pada prototype awal sampai menjadi prototyping akhir.  Dan memungkinkan lebih dari 3 kali, bahkan mungkin tidak sampai menjadi prototype Akhir.\n",
// "isPublic": true,
// "tags": [
// "agile",
// "software",
// "refactoring",
// "clean code",
// "hilirisasi"
// ],
// "createdAt": "2023-02-05T23:15:54.946Z",
// "comments": [],
// "updatedAt": "2023-02-14T06:47:40.990Z",
// "__v": 0,
// "coverArticle": "https://api-portfolio.gft.academy/storage/images/fileAlbum_1675639589385.png",
// "mermaidDiagram": ""
// }