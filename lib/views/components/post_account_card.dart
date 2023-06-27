import 'package:eportfolio_mobile/views/components/cores/text_widget.dart';
import 'package:eportfolio_mobile/views/components/icons/lock_icon.dart';
import 'package:eportfolio_mobile/views/components/icons/more_horitz_icon.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:flutter/material.dart';

class PostAccountCard extends StatelessWidget {
  /// Kartunya Akun Post
  final GetUser postUser;
  final GetPosts getPosts;
  final GestureTapCallback $onTapAccount;
  final GestureTapCallback $onTapMore;

  const PostAccountCard({
    super.key,
    required this.postUser,
    required this.getPosts,
    required this.$onTapAccount,
    required this.$onTapMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      // decoration: BoxDecoration(
      //   color: Colors.grey[100],
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info section
          GestureDetector(
            onTap: $onTapAccount,
            child: Row(
              children: [
                Container(
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(postUser.profilePicture),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(data: postUser.username),
                      if (postUser.role == 'mahasiswa')
                        SubTitleWidget(data: postUser.major ?? ''),
                      if (postUser.role == 'mahasiswa' &&
                          postUser.organization != null)
                        SubTitleWidget(data: postUser.organization ?? ''),
                      if (postUser.role != 'mahasiswa')
                        SubTitleWidget(data: postUser.academicField ?? ''),
                      Row(
                        children: [
                          SubTitleWidget(
                            data: getPosts.createdAt == 'today'
                                ? 'Today .'
                                : postUser.createdAt.toString(),
                          ),
                          if (!getPosts.isPublic) const LockIcon12(),
                        ],
                      )
                    ],
                  ),
                ),
                if (getPosts.userId == postUser.id)
                  InkWell(
                    onTap: $onTapMore,
                    child: const MoreHorizIcon24(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
