import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/components/article_account_card.dart';
import 'package:eportfolio_mobile/views/components/article_title_container.dart';
import 'package:eportfolio_mobile/views/components/modal-bottom-sheet.dart';
import 'package:eportfolio_mobile/views/components/home_markdown.dart';
import 'package:eportfolio_mobile/views/components/post_account_card.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticleController.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPostController.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/HOMECtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILECtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final tabController = Get.find<TabControllers>();
  final bottomSheetController = Get.find<BottomSheetController>();

  var userCtrl = Get.find<CurrentUserController>();
  late User currentUser = userCtrl.currentUser.value;
  var homeController = Get.find<HomeController>();

  Home({super.key});

  var imageUrls = [
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-1-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1635980933000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-3-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1636673255000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-6-202111?wid=728&hei=666&fmt=png-alpha&.v=1635178710000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-1-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1635980933000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-3-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1636673255000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-6-202111?wid=728&hei=666&fmt=png-alpha&.v=1635178710000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-1-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1635980933000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-3-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1636673255000',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-6-202111?wid=728&hei=666&fmt=png-alpha&.v=1635178710000',
  ];

  final GestureTapCallback $onTapAccount = () {
    print('halo');
  };

  PopupMenuItemSelected? $onTapMore(String result) {
    print('hai');
    return null;
  }

  final VoidCallback $onButtonMore = () {
    print('asdfkjdsaf');
  };

  Future? $onTapMoreHoriz() {
    bottomSheetController.toggleBottomSheet();
  }

  Future<void> onRefresh() async {
    final home_ = Get.find<HomeController>();
    home_.readContents();
    await Future.delayed(Duration(seconds: 2));
  }

  Future? $onTapEditHoriz(BuildContext context, String id) {
    Navigator.pop(context);

    Get.toNamed(RouteNames.editPost, arguments: id);
  }

  void $onTapDeleteHoriz(BuildContext context, String id) {
    Get.find<PostController>().deletePost(id);
    Get.find<HomeController>().readContents();

    Navigator.pop(context);
  }

  Future? $onTapEditHoriz1(BuildContext context, String id) {
    Navigator.pop(context);

    Get.toNamed(RouteNames.editArticle, arguments: id);
  }

  void $onTapDeleteHoriz1(BuildContext context, String id) {
    Get.find<ArticleController>().deleteArticle(id);
    Get.find<HomeController>().readContents();

    Navigator.pop(context);
  }

  // Future<void> loadData() async {
  //   await Future.delayed(Duration(seconds: 7)); // Menunda selama 3 detik
  //   // Lakukan permintaan data dari server atau proses lainnya
  // }

  @override
  Widget build(BuildContext context) {
    homeController.readUsers();
    homeController.readContents();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('ePortfolio GFT ACADEMY'),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child:                        GetBuilder<HomeController>(
          builder: ($) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CardWidgetBot(
                        widget: Container(
                          margin: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  tabController.changeTab(2);
                                },
                                child: ClipOval(
                                  child: Image.network(
                                    currentUser.profilePicture,
                                    width: 55,
                                    height: 55,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                width: 250,
                                child: Outlined_Btn_Component_Generic(
                                  'Apa yang Anda Pikirkan ?',
                                      () {},
                                  Colors.white,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.photo_library_rounded,
                                  size: 26,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      CardWidgetBot(
                        widget: SizedBox(
                          height: 220,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    left: 10, top: 10),
                                child: Text(
                                  'Projects Recomendation',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 180,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: imageUrls.map((url) {
                                    return Padding(
                                      padding:
                                      const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 100,
                                        height: 200,
                                        color: Colors.blue,
                                        // Ganti dengan warna latar belakang yang diinginkan
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.network(url),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate:
                  SliverChildBuilderDelegate((context, index) {
                    var content = $.contentList[index];
                    var contentUser = $.contentsUsers[index];
                    if (content.title != null &&
                        content.title!.isNotEmpty) {
                      return CardWidgetBot(
                        widget: Column(
                          children: [
                            ArticleAccountCard(
                              articleUser: contentUser,
                              article: content,
                              $onTapAccount: $onTapAccount,
                              $onTapMoreHoriz: () {
                                ModalBottomSheetHoriz.show(
                                  context,
                                      () => $onTapEditHoriz1(
                                      context, content.id),
                                      () => $onTapDeleteHoriz1(
                                      context, content.id),
                                );
                              },
                              currentUser: currentUser,
                            ),
                            ArticleTitleContainer(
                              article: content,
                            ),
                            HomeMarkdown(
                              desc: content.desc,
                              $onButtonMore: $onButtonMore,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return CardWidgetBot(
                        widget: Column(
                          children: [
                            PostAccountCard(
                              currentUser: currentUser,
                              postUser: contentUser,
                              post: content,
                              $onTapAccount: $onTapAccount,
                              $onTapMoreHoriz: () {
                                ModalBottomSheetHoriz.show(
                                  context,
                                      () => $onTapEditHoriz(
                                      context, content.id),
                                      () => $onTapDeleteHoriz(
                                      context, content.id),
                                );
                              },
                            ),
                            // ArticleTitleContainer(
                            //   getArticles: getArticles,
                            // ),
                            HomeMarkdown(
                              desc: content.desc,
                              $onButtonMore: $onButtonMore,
                            ),
                          ],
                        ),
                      );
                    }
                  }, childCount: $.contentList.length),
                ),
              ],
            );
          },
        ),



        // FutureBuilder<void>(
        //     future: loadData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child:
        //               CircularProgressIndicator(), // Tampilkan indikator loading
        //         );
        //       } else if (snapshot.hasError) {
        //         return Text('Terjadi kesalahan saat memuat data');
        //       } else {
        //
        //
        //
        //       }
        //     }),
      ),
    );

    // SingleChildScrollView(
    //     child: Column(
    //   children: [
    //     Card_Component_White(
    //       () {},
    //       Row(
    //         children: [
    //           InkWell(
    //             onTap: () {
    //               tabController.changeTab(2);
    //             },
    //             child: ClipOval(
    //               child: Image.network(
    //                 'https://avatars.githubusercontent.com/u/102400087?s=400&u=dc315d1370efc19d9568ea0e7ce644946e1a4dcb&v=4',
    //                 width: 60,
    //                 height: 60,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(left: 16),
    //             width: 250,
    //             child: Outlined_Btn_Component_Generic(
    //                 'Apa yang Anda Pikirkan ?', () {}, Colors.white),
    //           )
    //         ],
    //       ),
    //     ),
    //     SizedBox(height: 8.0),
    //     Card_Component_White(
    //       () {},
    //       SizedBox(
    //         height: 150,
    //         child: ListView(
    //             scrollDirection: Axis.horizontal,
    //             children: imageUrls.map((url) {
    //               return Padding(
    //                 padding: const EdgeInsets.all(4.0),
    //                 child: Container(
    //                   color: Colors.blue,
    //                   // Ganti dengan warna latar belakang yang diinginkan
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(10),
    //                     child: Image.network(url),
    //                   ),
    //                 ),
    //               );
    //             }).toList()),
    //       ),
    //     ),
    //
    //
    //   ],
    // )));
  }

  void $pressProduct() {
    // Get.toNamed(RouteName.productPage);
  }

  void $pressOrder() {
    // Get.toNamed(RouteName.itemsPage);
  }

  void $pressCustomer() {
    // Get.toNamed(RouteName.customerPage);
  }

  void $pressShop() {}

  static const padding =
      EdgeInsets.only(top: 32, bottom: 16, right: 16, left: 16);
  static const paddingLeftTop =
      EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 16);
  static const paddingLeftBottom =
      EdgeInsets.only(top: 8, bottom: 16, right: 8, left: 16);
  static const paddingRightTop =
      EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 8);
  static const paddingRightBottom =
      EdgeInsets.only(top: 8, bottom: 16, right: 16, left: 8);

  Expanded _expandedCard(EdgeInsets padding, void Function() pressButton,
      IconData icon, Color iconColor, String title, Color textColor) {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Container(
          decoration: ___boxDecor(),
          child: TextButton(
              onPressed: pressButton,
              child: ___colContent(icon, iconColor, title, textColor)),
        ),
      ),
    );
  }

  BoxDecoration ___boxDecor() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2), // Geser bayangan horizontal dan vertikal
        ),
      ],
    );
  }

  Column ___colContent(
      IconData icon, Color iconColor, String title, Color textColor) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ],
    );
  }
}

// List Tile silahkan tambahkan
// leading: CircleAvatar(
// backgroundImage: AssetImage('assets/image.jpg'),
// ),
