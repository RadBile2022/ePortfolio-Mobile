import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/views/components/profile_bar.dart';
import 'package:eportfolio_mobile/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';






class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool userData = true; // Dummy data, ganti dengan data sesungguhnya

    final String name = "John Doe"; // Dummy data, ganti dengan data sesungguhnya
    final String role = "mahasiswa"; // Dummy data, ganti dengan data sesungguhnya
    final String nim = "123456789"; // Dummy data, ganti dengan data sesungguhnya
    final String major = "Computer Science"; // Dummy data, ganti dengan data sesungguhnya
    final String academicField = "Information Technology"; // Dummy data, ganti dengan data sesungguhnya
    final String organization = "ABC Organization"; // Dummy data, ganti dengan data sesungguhnya
    final String city = "New York"; // Dummy data, ganti dengan data sesungguhnya
    final String dateBirth = "1990-01-01"; // Dummy data, ganti dengan data sesungguhnya
    final String gender = "male"; // Dummy data, ganti dengan data sesungguhnya



    String _markdownData = '''
    Saya (Radar) adalah 
### Lulusan Terbaik Prodi Pendidikan Agama Islam UIN Sayyid Ali Rahmatullah Tulungagung 
dengan 
## Indeks Prestasi Komulatif (IPK) 3.95/4.00 tahun 2022

saya sangat menyukai dunia pemrograman karena pertama kali belajar pemrograman di 
### GFT ACADEMY mengajarkan Fast Track yang tidak pernah diajarkan di tempat lain
    
    ''';

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userData)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add block to profile"),
                    Icon(Icons.add),
                  ],
                ),
              ),
            SizedBox(height: 16),





            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: $name"),
                        if (role == "mahasiswa")
                          Text("Student ID: ${nim ?? ""}"),
                        if (role == "mahasiswa")
                          Text("Major: ${major ?? ""}"),
                        if (role != "mahasiswa")
                          Text("Academic Field: ${academicField ?? ""}"),
                        Text("Organization: ${organization ?? ""}"),
                        Text("City: ${city ?? ""}"),
                        Text("Date Of Birth: ${dateBirth ?? ""}"),
                        Text("Gender: ${gender != null ? gender : ""}"),
                        Text("Role: ${role != null ? role : ""}"),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Markdown(
                      shrinkWrap: true,
                      selectable: true,
                      data: _markdownData,
                    )
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}


class DummySocialMedia extends StatelessWidget {

  String linkedin = "https://www.linkedin.com";
  String github = "https://www.github.com";
  String ig = "https://www.instagram.com";
  String facebook = "https://www.facebook.com";
  String twitter = "https://www.twitter.com";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Social Media',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Tombol edit di tekan
                  Navigator.pushNamed(context, '/edit-socmed');
                },
                child: Icon(Icons.edit),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 8.0),
            child: Wrap(
              children: [
                if (linkedin != null && linkedin.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.clear),
                    label: Text('LinkedIn'),
                  ),
                if (github != null && github.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.code),
                    label: Text('Github'),
                  ),
                if (ig != null && ig.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.camera_alt),
                    label: Text('Instagram'),
                  ),
                if (facebook != null && facebook.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.facebook),
                    label: Text('Facebook'),
                  ),
                if (twitter != null && twitter.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.three_k_plus_outlined),
                    label: Text('Twitter'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}