import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PostsTab extends StatelessWidget {
  final GetUser getUser;
  final List<dynamic> getPostsAll;
  PostsTab({super.key,required this.getUser, required this.getPostsAll});



  Widget __titleCardPost (GetPosts getPosts){
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
                      image: NetworkImage(getUser.profilePicture),
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
                        getUser.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      if (getUser.role == 'mahasiswa')
                        Text(
                          getUser.major ?? '',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (getUser.role == 'mahasiswa' && getUser.organization != null)
                        Text(
                          '| ${getUser.organization}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (getUser.role != 'mahasiswa')
                        Text(
                          getUser.academicField ?? '',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (getUser.role != 'mahasiswa' && getUser.organization != null)
                        Text(
                          getUser.organization,
                          style: TextStyle(fontSize: 12.0),
                        ),

                      Row(
                        children: [
                          Text(
                            getPosts.createdAt == 'today'
                                ? 'Today .'
                                : getUser.createdAt.toString(), // Replace with desired date format
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          if (!getPosts.isPublic)
                            Icon(Icons.lock, size:12, color: Colors.grey,),

                        ],
                      )


                    ],
                  ),
                ),
                if(getPosts.userId == getUser.id)
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




  Markdown __descCardAbout(GetPosts getPosts) {
    return Markdown(
     padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      selectable: true,
      data: getPosts.desc,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

Column _columnCardPost(GetPosts getPosts){
    return Column(children: [
      __titleCardPost(getPosts),
      __descCardAbout(getPosts)
    ],);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: ListView.builder(
            itemCount: getPostsAll.length,
            itemBuilder: (context, index){
              var getPost = getPostsAll[index];
              return Card_Component_White(() { }, _columnCardPost(getPost));
            })
    );
  }

}