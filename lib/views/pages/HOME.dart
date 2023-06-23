import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain/TABcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final tabController = Get.find<TabControllers>();

  var getUserCtrl = Get.find<GetUserController>();

  Home({super.key});
  var imageUrls=[
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-1-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1635980933000',
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-3-202111_GEO_US?wid=728&hei=666&fmt=png-alpha&.v=1636673255000',
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone12-digitalmat-gallery-6-202111?wid=728&hei=666&fmt=png-alpha&.v=1635178710000'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('ePortfolio GFT ACADEMY'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Card_Component_White(
                            () {},
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      tabController.changeTab(2);
                    },
                    child: ClipOval(
                      child: Image.network(
                        getUserCtrl.getUser.value.profilePicture,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 250,
                    child:Outlined_Btn_Component_Generic(
                        'Apa yang Anda Pikirkan ?', () {}, Colors.white),
                  )


                ],
              ),
            ),
            SizedBox(height: 8.0),
            Card_Component_White(() { },SizedBox(height : 150, child: ListView(
                scrollDirection: Axis.horizontal,

                children: imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.blue, // Ganti dengan warna latar belakang yang diinginkan
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    ),
                  )
                  ;
                }).toList()),),),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: padding,
                  child: Container(
                      decoration: ___boxDecor(),
                      child: Image.network(
                          'https://api-portfolio.gft.academy/storage/images/fileAlbum_1676562854739.jpg')),
                ))
              ],
            ),
            Row(
              children: [
                _expandedCard(paddingLeftTop, $pressProduct, Icons.cases_sharp,
                    Colors.amber, 'Products', Colors.black),
                _expandedCard(
                    paddingRightTop,
                    $pressOrder,
                    Icons.shopping_cart_sharp,
                    Colors.red,
                    'Order',
                    Colors.black)
              ],
            ),
            Row(
              children: [
                _expandedCard(
                    paddingLeftBottom,
                    $pressCustomer,
                    Icons.account_box_sharp,
                    Colors.green,
                    'Customer',
                    Colors.black),
                _expandedCard(paddingRightBottom, $pressShop, Icons.shop,
                    Colors.deepOrange, 'Shop', Colors.black)
              ],
            ),
            // Tambahkan kode di sini untuk dua tombol lainnya (Customer dan Settings)
          ],
        )));
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
