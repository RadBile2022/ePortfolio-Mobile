import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  final MyController controller = Get.put(MyController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends GetView<MyController> {
  final MyController controller = Get.find<MyController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('My App'),
            pinned: true,
            floating: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('background_image.jpg', fit: BoxFit.cover),
            ),
            bottom: TabBar(
              controller: controller.tabController,
              tabs: controller.myTabs,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller.tabController,
              children: controller.myTabViews,
            ),
          ),
        ],
      ),
    );
  }
}

class MyController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Tab> myTabs = [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
  ];

  List<Widget> myTabViews = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
