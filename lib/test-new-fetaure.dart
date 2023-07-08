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
  bool _isRefreshing = false;
  List<String> items = List.generate(20, (index) => 'Item ${index + 13}');

  Future<void> _onRefresh() async {
    if (_isRefreshing) return;

    setState(() {
      _isRefreshing = true;
    });

    // Simulate loading process
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      items = List.generate(20, (index) => 'Item ${index + 1} (Reloaded)');
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: _isRefreshing
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16.0,
                      height: 16.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Refreshing...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                )
                    : Text(
                  'Pull to Refresh',
                  style: TextStyle(fontSize: 16.0),
                ),
              );
            }

            final itemIndex = index - 1;
            return ListTile(
              title: Text(items[itemIndex]),
            );
          },
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
