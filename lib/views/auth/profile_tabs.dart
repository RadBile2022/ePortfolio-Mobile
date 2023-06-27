import 'package:flutter/material.dart';

class Profile_Tabs extends StatefulWidget {
  @override
  _Profile_TabsState createState() => _Profile_TabsState();
}

class _Profile_TabsState extends State<Profile_Tabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.people),
              ),
              Tab(
                icon: Icon(Icons.video_library),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.menu),
              ), Tab(
                icon: Icon(Icons.menu),
              ), Tab(
                icon: Icon(Icons.menu),
              ),
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        HomeTab(),
                        PeopleTab(),
                        VideoTab(),
                        NotificationsTab(),
                        MenuTab(),
                        MenuTab(),
                        MenuTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Tab'),
    );
  }
}

class PeopleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('People Tab'),
    );
  }
}

class VideoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video Tab'),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notifications Tab'),
    );
  }
}

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Tab'),
    );
  }
}
