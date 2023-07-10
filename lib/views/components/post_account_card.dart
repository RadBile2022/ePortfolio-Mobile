import 'package:eportfolio_mobile/views/components/cores/text_widget.dart';
import 'package:eportfolio_mobile/views/components/modal-bottom-sheet.dart';
import 'package:eportfolio_mobile/views/components/icons/lock_icon.dart';
import 'package:eportfolio_mobile/views/components/icons/more_horitz_icon.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPost.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:flutter/material.dart';

class PostAccountCard extends StatelessWidget {
  /// Kartunya Akun Post
  final User currentUser;
  final User postUser;
  final Post post;
  final GestureTapCallback $onTapAccount;
  final VoidCallback $onTapMoreHoriz;


  const PostAccountCard({
    super.key,
    required this.currentUser,
    required this.postUser,
    required this.post,
    required this.$onTapAccount,
    required this.$onTapMoreHoriz,
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
                            data: post.createdAt == 'today'
                                ? 'Today .'
                                : postUser.createdAt.toString(),
                          ),
                          if (!post.isPublic) const LockIcon12(),
                        ],
                      )
                    ],
                  ),
                ),
                if (post.userId == currentUser.id)
                  MoreHorizIcon24($onTapMoreHoriz: $onTapMoreHoriz)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
