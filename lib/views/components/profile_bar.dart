import 'package:flutter/material.dart';

class Profile_Bar extends StatelessWidget {
  var profilePicture = 'https://api-portfolio.gft.academy/storage/images/profilePicture_1675396879415.jpg';
  var name = 'Radarss';
  var role ='mahasiswa',major='yuy',nim='12',interest='jyjgh',academicField;
  var following =[], followers =[];

  Profile_Bar({super.key,
    required this.profilePicture,
    required this.name,
    required this.role,
    required this.major,
    required this.nim,
    required this.interest,
    required this.academicField,
    required this.following,
    required this.followers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(
        margin: const EdgeInsets.only(top: 10),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        child: ClipOval(
          child: Image.network(
            profilePicture,
            fit: BoxFit.cover,
          ),
        ),
      ),

        Text(
          name,
          style:
          TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: role == "mahasiswa" ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    major != null ? major : "null",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nim != null ? nim : "null",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    interest != null ? interest : "null",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ) : Text(
            academicField != null ? academicField : "null",
            textAlign: TextAlign.center,
          ),
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                      text: followers.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                    text: ' Followers',
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                      text: following.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                    text: ' Following',
                  ),
                ],
              ),
            ),
          ],
        )
      ],
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