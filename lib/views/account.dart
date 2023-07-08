
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Scroll paling atas telah tercapai
      setState(() {
        isLoading = true;
      });

      // Simulasikan proses loading
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          items = List.generate(20, (index) => 'Item ${index + 1} (Reloaded)');
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent &&
                !isLoading) {
              // Scroll paling bawah telah tercapai
              // Lakukan logika muat lebih banyak konten di sini
            }
          }
          return true;
        },
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                // Membuat item daftar konten
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
            if (isLoading)
              Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}


















class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();

}

class _AccountState  extends State<Account>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Wahyu Wiradarma'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://api-portfolio.gft.academy/storage/images/profilePicture_1675396879415.jpg'),
            ),
            accountEmail: Text('wahradar511@gmail.com'),
          ),
          DrawerListTile(
            iconData: Icons.settings,
            title: 'Settings',
            onTilePressed: () {},
          ),

          DrawerListTile(
            iconData: Icons.lock,
            title: 'Migrate to Pro',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.policy,
            title: 'Syarat dan Ketentuan',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.star_rate,
            title: 'Beri Rating',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.help_center,
            title: 'Pusat Bantuan',
            onTilePressed: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.red),
            title: Text('Keluar', style: TextStyle(color: Colors.red, fontSize: 16),),
            onTap: (){},
          )


        ],
      ),
    );
  }

}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({Key? key, this.iconData, this.title, this.onTilePressed}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,style: TextStyle(fontSize: 16),
      ),
    );
  }}