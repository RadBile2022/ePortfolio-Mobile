import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
   Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Pizza Delivery Order'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: padding,
                  child: Container(
                      decoration: ___boxDecor(),
                      child: Image.network(
                          'https://img.freepik.com/premium-vector/pizza-delivery-man-cartoon-logo_12402-683.jpg?w=740')),
                ))
              ],
            ),
            Row(
              children: [
                _expandedCard(paddingLeftTop, $pressProduct,
                    Icons.cases_sharp, Colors.amber, 'Products', Colors.black),
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

  void $pressShop(){}

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

  Expanded _expandedCard(EdgeInsets padding, void Function() pressButton, IconData icon,
      Color iconColor, String title, Color textColor) {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Container(
          decoration: ___boxDecor(),
          child:  TextButton(
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