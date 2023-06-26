import 'package:eportfolio_mobile/views/pages/GetArticles/GetArticlesCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticlesTab extends StatelessWidget {
  final GetUser getUser;
  final List<dynamic> getArticlesAll;

  ArticlesTab({super.key, required this.getUser, required this.getArticlesAll});

  Widget __titleCardPost(GetArticles getArticles) {
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
                      if (getUser.role == 'mahasiswa' &&
                          getUser.organization != null)
                        Text(
                          '| ${getUser.organization}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (getUser.role != 'mahasiswa')
                        Text(
                          getUser.academicField ?? '',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      if (getUser.role != 'mahasiswa' &&
                          getUser.organization != null)
                        Text(
                          getUser.organization,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      Row(
                        children: [
                          Text(
                            getArticles.createdAt == 'today'
                                ? 'Today .'
                                : getUser.createdAt.toString(),
                            // Replace with desired date format
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          if (!getArticles.isPublic)
                            Icon(
                              Icons.lock,
                              size: 12,
                              color: Colors.grey,
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                if (getArticles.userId == getUser.id)
                  InkWell(
                      onTap: () {
                        print('hai');
                      },
                      child: Icon(Icons.more_horiz)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column __coverCardArticles(GetArticles getArticles) {
    return Column(
      children: [
        Text(
          getArticles.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 12),
        if (getArticles.coverArticle != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(getArticles.coverArticle),
          ),
      ],
    );
  }

  Markdown __descCardAbout(GetArticles getArticles) {
    return Markdown(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      shrinkWrap: true,
      selectable: true,
      data: getArticles.desc.toString().length <=180 ? getArticles.desc :  getArticles.desc.toString().substring(0, 180) + '.....' ,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Column _columnCardPost(GetArticles getArticles) {
    print(getArticles.title);
    print(getArticles.coverArticle);
    return Column(
      children: [
        __titleCardPost(getArticles),
        __coverCardArticles(getArticles),
        __descCardAbout(getArticles),
        Container(
          alignment: Alignment.topRight,
          child: TextButton(
            child: Text(
              'Read More ...',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: ListView.builder(
            itemCount: getArticlesAll.length,
            itemBuilder: (context, index) {
              var getArticles = getArticlesAll[index];
              return Card_Component_White(() {}, _columnCardPost(getArticles));
            }));
  }
}
