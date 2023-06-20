class AboutMe {
  var id, username, profilePicture, followings = [], followers = [];

  var role,
      academicField,
      interest,
      nim,
      major,
      organization,
      city,
      dateBirth,
      gender;

  var about, socialMedia, skills = [], blockProfiles = [], createdAt, email;

  AboutMe.instance({
    this.id,
    this.username,
    this.profilePicture,
    required this.followings,
    required this.followers ,
    this.role,
    this.academicField,
    this.interest,
    this.nim,
    this.major,
    this.organization,
    this.city,
    this.dateBirth,
    this.gender,
    this.about,
    this.socialMedia,
    required this.skills ,
    required this.blockProfiles,
    this.createdAt,
    this.email,
  });

  // factory AboutMe.fromJson(Map<String, dynamic> json){
  //   return AboutMe.instance(followings:  (json['items'] as List<dynamic>)
  //       .map((itemJson) => Item.fromJson(itemJson))
  //       .toList(), followers: followers, skills: skills, blockProfiles: blockProfiles)
  // }
}

class SocMed {
  var linkedin, github, instagram, facebook, twitter;

  SocMed.instance(
      this.linkedin, this.github, this.instagram, this.facebook, this.twitter);

  factory SocMed.fromJson(Map<String, dynamic> json) {
    return SocMed.instance(json['linkedin'], json['github'], json['instagram'],
        json['facebook'], json['twitter']);
  }

  Map<String, dynamic> toJson() {
    return {
      'linkedin': linkedin,
      'github': github,
      'instagram': instagram,
      'facebook': facebook,
      'twitter': twitter
    };
  }
}
// "socialMedia": {
// "instagram": "wah_radar",
// "linkedin": "https://www.linkedin.com/in/wahyu-wiradarma/",
// "twitter": "wesyo",
// "github": "https://www.github.com/RadBile2022",
// "facebook": "wesyo"
// },
// "_id": "63dc6409165337cbbf8a1d8b",
// "username": "Radarss",
// "email": "wahradar511@gmail.com",
// "organization": "lambdas",
// "skill": [],
// "role": "mahasiswa",
// "blockProfile": [],
// "following": [
// "6397fe5fbfe53e713a1c10d8",
// "63d8291c15ce48fd2ecfd9ea"
// ],
// "followers": [
// "63d8291c15ce48fd2ecfd9ea",
// "63e9e195a650fcf4ac06b6b1",
// "6397fe5fbfe53e713a1c10d8"
// ],
// "createdAt": "2023-02-03T01:31:53.102Z",
// "__v": 0,
// "academicField": "Software Engineerss",
// "city": "malangs",
// "dateBirth": "2023-03-02T00:00:00.000Z",
// "gender": "male",
// "interest": " Software Engineer",
// "major": "undefined",
// "nim": "undefined",
// "profilePicture": "storage/images/profilePicture_1675396879415.jpg",
// "about":
