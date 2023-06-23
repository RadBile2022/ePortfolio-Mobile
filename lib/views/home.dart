import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final String comment;

  CommentCard(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      color: Colors.grey[200],
      child: Text(comment),
    );
  }
}

class DropdownPost extends StatelessWidget {
  final String idPost;

  DropdownPost(this.idPost);

  @override
  Widget build(BuildContext context) {
    return Container(
      // DropdownPost implementation
      child: Text('DropdownPost'),
    );
  }
}

class MarkdownViewer extends StatelessWidget {
  final String value;

  MarkdownViewer(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      // MarkdownViewer implementation
      child: Text(value),
    );
  }
}

class DummyFlutterWidget extends StatefulWidget {
  @override
  _DummyFlutterWidgetState createState() => _DummyFlutterWidgetState();
}

class _DummyFlutterWidgetState extends State<DummyFlutterWidget> {
  String userId = 'dummyUserId';
  String profilePicture = 'dummyProfilePicture';
  String commentInput = '';
  List<String> comments = [
    'Comment 1',
    'Comment 2',
    'Comment 3',
  ];
  bool commentVisible = false;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String userIdPost = 'dummyUserId';
    String profilePicturePost = 'https://api-portfolio.gft.academy/storage/images/profilePicture_1675396879415.jpg';
    String nameUserPost = 'John Doe';
    String majorUserPost = 'Computer Science';
    String organizationUserPost = 'OpenAI';
    String roleUserPost = 'mahasiswa';
    String academicFieldPost = 'Computer Science';
    bool isPublicPost = false;

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info section
          GestureDetector(
            onTap: () {
              print('hallo dek');
              // String route = userId == userIdPost ? '/profile' : '/profile/$userIdPost';
              // Navigator.pushNamed(context, route);
            },
            child: Row(
              children: [
                Container(
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profilePicturePost),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameUserPost,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      if (roleUserPost == 'mahasiswa')
                        Text(
                          majorUserPost ?? '',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (roleUserPost == 'mahasiswa' && organizationUserPost != null)
                        Text(
                          '| $organizationUserPost',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (roleUserPost != 'mahasiswa')
                        Text(
                          academicFieldPost ?? '',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (roleUserPost != 'mahasiswa' && organizationUserPost != null)
                        Text(
                          organizationUserPost,
                          style: TextStyle(fontSize: 12.0),
                        ),

                      Row(
                        children: [
                          Text(
                            today == today
                                ? 'Today .'
                                : today.toString(), // Replace with desired date format
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          if (!isPublicPost)
                             Icon(Icons.lock, size:12, color: Colors.grey,),

                        ],
                      )


                    ],
                  ),
                ),
                if(userIdPost == userId)
                 InkWell(onTap: (){
                   print('hai');
                      },child: Icon(Icons.more_horiz)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Dummy Flutter Widget'),
      ),
      body: DummyFlutterWidget(),
    ),
  ));
}
