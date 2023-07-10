import 'package:eportfolio_mobile/controllers/api/endpoint.dart';

class User {
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

  var about, socialMedia, skills = [], blockProfiles = [];
  var createdAt, email;

  User.instance({
    this.id,
    this.username,
    this.profilePicture,
    required this.followings,
    required this.followers,
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
    required this.skills,
    required this.blockProfiles,
    this.createdAt,
    this.email,
  });

  User();

  factory User.fromJson(Map<String, dynamic> json) {
    return User.instance(
      id: json['_id'],
      username: json['username'],
      profilePicture: '${Endpoint.$$baseUrl}/${json['profilePicture']}',
      followings: json['following'],
      followers: json['followers'],
      role: json['role'],
      academicField: json['academicField'],
      interest: json['interest'],
      nim: json['nim'],
      major: json['major'],
      organization: json['organization'],
      city: json['city'],
      dateBirth: json['dateBirth'],
      gender: json['gender'],
      about: json['about'],
      socialMedia: SocMed.fromJson(json['socialMedia']),
      skills: json['skill'],
      blockProfiles: json['blockProfile'],
      createdAt: json['createdAt'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'GetUser{id: $id, username: $username, profilePicture: $profilePicture, followings: $followings, followers: $followers, role: $role, academicField: $academicField, interest: $interest, nim: $nim, major: $major, organization: $organization, city: $city, dateBirth: $dateBirth, gender: $gender, about: $about, socialMedia: $socialMedia, skills: $skills, blockProfiles: $blockProfiles, createdAt: $createdAt, email: $email}';
  }
}

class SocMed {
  var linkedin, github, instagram, facebook, twitter;

  SocMed.instance(
      this.linkedin,
      this.github,
      this.instagram,
      this.facebook,
      this.twitter,
      );

  factory SocMed.fromJson(Map<String, dynamic> json) {
    return SocMed.instance(
      json['linkedin'],
      json['github'],
      json['instagram'],
      json['facebook'],
      json['twitter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'linkedin': linkedin,
      'github': github,
      'instagram': instagram,
      'facebook': facebook,
      'twitter': twitter,
    };
  }
}